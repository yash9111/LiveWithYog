import json

def extract_english_name_and_benefits(data):
    result_data = []
    for category in data:
        category_name = category.get('category_name', '')
        poses = category.get('poses', [])
        
        category_data = {
            'category_name': category_name,
            'poses_data': []
        }

        for pose in poses:
            english_name = pose.get('english_name', '')
            pose_benefits = pose.get('pose_benefits', '')

            pose_data = {
                'english_name': english_name,
                'pose_benefits': pose_benefits
            }

            category_data['poses_data'].append(pose_data)

        result_data.append(category_data)

    return result_data

# Read JSON data from the input file with specified encoding
input_file_path = 'input_data.json'  # Replace with the actual path to your input file
output_file_path = 'PosesWithBenefits.json'  # Replace with the desired output file path

with open(input_file_path, 'r', encoding='utf-8') as input_file:
    jsonData = json.load(input_file)

# Process the data
processed_data = extract_english_name_and_benefits(jsonData)

# Write the processed data to the output file
with open(output_file_path, 'w', encoding='utf-8') as output_file:
    json.dump(processed_data, output_file, indent=2, ensure_ascii=False)

print(f"Processed data has been written to {output_file_path}")
