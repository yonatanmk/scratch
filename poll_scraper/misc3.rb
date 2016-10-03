require 'spreadsheet'

# row_1 = ['A1', 'B1']
# row_2 = ['A2', 'B2']
# row_3 = ['A3', 'B3']
#
# # Open the previously created Workbook
# open_book = Spreadsheet.open('test.xls')
#
# # Get the row index in order to append a new row
# # after any exisitng rows with data
# new_row_index = open_book.worksheet(0).last_row_index + 1
#
# # Indicate the row index to the user
# print "Inserting new row at index: #{new_row_index}\n"
#
# # Insert row_2
# open_book.worksheet(0).insert_row(2, row_2)
#
# # Delete the file so that it can be re-written
# #File.delete('test.xls')
#
# # Write out the Workbook again
# #open_book.write('test.xls')
#
# # End Test
# print "Test Complete.\n"

# book = Spreadsheet::Workbook.new
#
# sheet1 = book.create_worksheet
#
# sheet1[0,0] = "Sept 1"
# sheet1[1,0] = "Sept 2"
# sheet1[2,0] = "Sept 3"
#
# sheet1[0,1] = 4
# sheet1[1,1] = 6
# sheet1[2,1] = 8

worksheet = nil
    Spreadsheet.open workbook_name do |inner_book|
      worksheet = inner_book.worksheet 0
    end
worksheet

book = Spreadsheet.open '/Users/yehonatanmeschede-krasa/Desktop/scratch/poll_scraper/poll_graph.xls'

sheet = book.worksheet 0
sheet.each do |row|
  row[1] = 40
end

book.write '/Users/yehonatanmeschede-krasa/Desktop/scratch/poll_scraper/poll_graph.xls'
