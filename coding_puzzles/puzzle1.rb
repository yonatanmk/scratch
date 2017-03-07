def  wiggleArrangeArray( intArr)
  arr = intArr.sort{ |a,b| a<=>b }
  outArr = []
  until arr.length == 0
    if (intArr.length - arr.length) % 2 == 0
      outArr << arr.pop
    else
      outArr << arr.shift
    end
  end
  puts outArr
end

arr = [7,5,2,7,8,-2,25,25]
wiggleArrangeArray(arr)
