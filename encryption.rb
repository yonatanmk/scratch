def encryption phrase
    encrypted_phrase = ""
    alphabet = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890`~!@{$%^&*()-_=+}/?.>,<;:'[]®ç|   "
    phrase.split("").each do |letter|
        encrypted_phrase << alphabet[rand(alphabet.length)]
    end
    return encrypted_phrase
end

def decryption encrypted_phrase, orig_phrase
    while true
        puts "Please enter a short phrase to be decrypted"
        code = gets.chomp
        if code == encrypted_phrase
            puts "The original phrase was:"
            puts orig_phrase
            break
        else
            puts "There was no such encrypted phrase"
            puts
        end
    end
end
#--------------------------------------------------------------------------------------------------------------
puts "Please enter a short phrase to be encrypted"
phrase = gets.chomp

encrypted = encryption phrase
puts "Your encrypted phrase is:"
puts encrypted
puts

decryption encrypted, phrase
