# x = "best"
# y = 5
#
# puts "This is the #{y == 1 ? '1': (y == 2 ? '2': "other") } question"

name = "hello"
puts "#{if name.length < 2; 'name'; elsif name.length < 30; 'name2'; else; 'name3'; end}"

# gender_list = 1
# skin_list = 1
# hair_list = 1
#
# puts "#{
#   gender_list == 1 ?
#     (skin_list == 1 ? '2' : '3')
#   : (skin_list == 1 ?
#     '3'
#   :
#     '4')}. Hair Color."
#
# puts "#{
#   gender_list == 1 ?
#     (skin_list == 1 ?
#       (hair_list == 1 ?
#         '2'
#       :
#         '3')
#     :
#       (hair_list == 1 ?
#         '3'
#       :
#         '4'))
#   :
#     (skin_list == 1 ?
#       (hair_list == 1 ?
#         '3'
#       :
#         '4')
#     :
#       (hair_list == 1 ?
#         '4'
#       :
#         '5'))
#       }. Eye Color."
#
# #    puts "#{current_suspect_list.gender_list.length == 1 ? (current_suspect_list.skin_list.length == 1 ? '2' : '3') : (current_suspect_list.skin_list.length == 1 ? '3' : '4')}. Hair Color."
#
# puts "#{
#   current_suspect_list.gender_list.length == 1 ?
#     (current_suspect_list.skin_list.length == 1 ?
#       (current_suspect_list.hair_list.length == 1 ?
#         '2'
#       :
#         '3')
#     :
#       (current_suspect_list.hair_list.length == 1 ?
#         '3'
#       :
#         '4'))
#   :
#     (current_suspect_list.skin_list.length == 1 ?
#       (current_suspect_list.hair_list.length == 1 ?
#         '3'
#       :
#         '4')
#     :
#       (current_suspect_list.hair_list.length == 1 ?
#         '4'
#       :
#         '5'))
#       }. Eye Color."
#
# puts "#{current_suspect_list.gender_list.length == 1 ? (current_suspect_list.skin_list.length == 1 ? (current_suspect_list.hair_list.length == 1 ? '2' : '3') : (current_suspect_list.hair_list.length == 1 ? '3' :
#         '4')) : (current_suspect_list.skin_list.length == 1 ? (current_suspect_list.hair_list.length == 1 ? '3' : '4') : (current_suspect_list.hair_list.length == 1 ? '4' : '5'))}. Eye Color." unless
