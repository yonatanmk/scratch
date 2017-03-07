def  lonelyInteger( arr)
    newArr = []
    arr.each do |x|
        if newArr.include?(x)
            newArr.delete(x)
        else
            newArr.push(x)
        end
    end

    return newArr.first

end
