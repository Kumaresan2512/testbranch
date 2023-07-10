import language_tool_python

tool = language_tool_python.LanguageTool('pt-PT')
tool.enabled_rules = {'PT_AGREEMENT_REPLACE'}
# Path to the input file
input_file = 'chunk_1.txt'
# Path to the output file
output_file = 'output_2.txt'

# Read the content from the input file
with open(input_file, 'r',encoding='utf-8-sig') as file:
    content = file.read()

# Check for language errors
errors = tool.check(content)
#errors = [rule for rule in errors if is_bad_rule(rule)]
my_dictionary = {}
# Store the result in the output file
with open(output_file, 'w',encoding='utf-8-sig') as file:
    for error in errors:
        if 'é uma forma do antigo acordo ortográfico. No novo acordo ortográfico, a palavra escreve-se assim:' in error.message:
            print(str(error.message.replace('é uma forma do antigo acordo ortográfico. No novo acordo ortográfico, a palavra escreve-se assim:','').replace('‘','').replace('’','').replace('.','')))
            cleaned_keyword = str(error.message.replace('é uma forma do antigo acordo ortográfico. No novo acordo ortográfico, a palavra escreve-se assim:','').replace('‘','').replace('’','').replace('.',''))
            cleaned_keyword_split = cleaned_keyword.strip().split(' ')
            print(cleaned_keyword_split)
            my_dictionary[cleaned_keyword_split[0]] = cleaned_keyword_split[2]
            file.write(str(error.message.replace('é uma forma do antigo acordo ortográfico. No novo acordo ortográfico, a palavra escreve-se assim:',"")) + '\n')
print(my_dictionary)
tool.close()