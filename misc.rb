def listmaker(word_list_file, listnum): # compiles word collection from word_list_file of length 'listnum' into a list
    word_list_2 = []
    while True:
        word_addition = word_list_file.readline()
        word_addition = word_addition[:len(word_addition) - 1]
        word_list_2.append(word_addition)
        if len(word_list_2) == listnum:
            break
    return word_list_2
