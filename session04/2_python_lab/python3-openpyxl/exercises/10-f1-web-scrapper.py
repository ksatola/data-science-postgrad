from openpyxl import Workbook
from requests import get
from requests.exceptions import RequestException
from contextlib import closing
from bs4 import BeautifulSoup
import os

def simple_get(url):
    """
    Attempts to get the content at `url` by making an HTTP GET request.
    If the content-type of response is some kind of HTML/XML, return the
    text content, otherwise return None
    """
    try:
        with closing(get(url, stream=True)) as resp:
            if is_good_response(resp):
                return resp.content
            else:
                return None

    except RequestException as e:
        log_error('Error during requests to {0} : {1}'.format(url, str(e)))
        return None


def is_good_response(resp):
    """
    Returns true if the response seems to be HTML, false otherwise
    """
    content_type = resp.headers['Content-Type'].lower()
    return (resp.status_code == 200 
            and content_type is not None 
            and content_type.find('html') > -1)


def log_error(e):
    """
    It is always a good idea to log errors. 
    This function just prints them, but you can
    make it do anything.
    """
    print(e)

def acquire_races_urls(races_url):
    root_content = simple_get(races_url)
    root_html = BeautifulSoup(root_content, 'html.parser')

    race_urls = []
    for race_tag in root_html.select('.resultsarchive-filter-item'):
        links = [(a.text, a['href']) for a in race_tag.select('a')
                if a['href'].find('race-result.html') > -1]
        if links:
            race_urls.append(links[0])
    return race_urls

def analyze_race_result(race_html):
    """
    Analyzes race webpage and populates results from it.
    """
    name = race_html.select('.ResultsArchiveTitle')[0].text.strip()
    results_table_tag = race_html.select('.resultsarchive-table')[0]
    positions = [] 
    for row in results_table_tag.select('tbody tr'):
        cells = row.select('td')
        pos = cells[1].text
        no = cells[2].text
        driver = cells[3].text.replace('\n', ' ').strip()
        car = cells[4].text
        time = cells[6].text
        pts = cells[7].text
        positions.append((pos, no, driver, car, time, pts))
    return (name, positions)
    
def store_results(wb, name, positions):
    ws = wb.create_sheet(name.replace('\n', '').strip())
    for row in positions:
        ws.append(row)


# Change directory 
os.chdir("./exercises")
wb = Workbook()
root_url = 'https://www.formula1.com'
start_url = 'https://www.formula1.com/en/results.html/2017/races/94/great-britain/race-result.html'

race_urls = acquire_races_urls(start_url)

for race_url in race_urls:
    race_content = simple_get(root_url + race_url[1])
    race_html = BeautifulSoup(race_content, 'html.parser')
    (name, results) = analyze_race_result(race_html)
    store_results(wb, race_url[0], results)

# remove default sheet
ws = wb.active
wb.remove(ws)
wb.save('./data/f1-results.xlsx')
   