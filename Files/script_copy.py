
import json
import os

disallow_listy = [
    'Asset Custom Data',
    'Axonius Catalog',
    'Axonius Discovery',
    'Axonius Identity Management',
    'Custom Data',
    'Draft',
    'EC Artifacts',
    'NWIS',
    'PM Status',
    'Test Ticketing',
    'WMI Info',
    'Ping Identity',
]

def open_json_file(file_path):
    with open(file_path, 'r') as file:
        return json.load(file)
    
def by_name_lower(item):
    return item['name'].lower()

def create_docu():
    plugin_meta = open_json_file('plugins/gui/frontend/public/plugin_meta.json')
    adapter_categories = open_json_file('plugins/gui/configs/json/adapter_categories.json')
    reargened_adapters = {}
    for category in adapter_categories:
        reargened_adapters[category['category_id']] = category['category_name']
    results = []
    for adapter_name, adapter_details in plugin_meta.items():

        if adapter_details.get('status') != "GA" or adapter_details.get('title') in disallow_listy:
            continue
        temp = []
        for category in adapter_details.get('categories',[]):
            if not category:
                continue
            if name_catgory := reargened_adapters.get(int(category)):
                temp.append(name_catgory)
        path_to_look = 'axonius-libs/src/libs/axonius-py/axonius/assets/logos/adapters/'
        logo = None
        for path in os.listdir(path_to_look):
            if (adapter_name == path.split('/')[-1].split('.')[0] or adapter_name.replace('_adapter', '') == path.split('/')[-1].split('.')[0]):
                logo = "https://raw.githubusercontent.com/Axonius/ax-docs-pub/refs/heads/main/img/adapter_icons/" + path
                break
        result = {
            'logo': logo,
            'name': adapter_details.get('title'),
            'href': adapter_details.get('link','').replace('https://docs.axonius.com', ''),
            'description': adapter_details.get('description'),
            'solutionCategories': temp,
            'assetsFetched': [asset.title().replace('_', ' ') for asset in adapter_details.get('assets')]
        }
        results.append(result)
    results = sorted(results, key=by_name_lower)
    with open('adapters.json', 'w') as file:
        json.dump(results, file, indent=4, ensure_ascii=False)

create_docu()