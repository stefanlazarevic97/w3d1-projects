def factors(num)
    factors = []
    (1..num).each { |i| factors << i if num % i == 0 }
    factors
end

class Array
    def bubble_sort!(&prc)
        sorted = false

        while !sorted
            sorted = true

            (0...self.length - 1).each do |i|
                if prc.call(self[i], self[i + 1]) == 1
                    self[i], self[i + 1] = self[i + 1], self[i]
                    sorted = false
                end
            end
        end

        self
    end

    def bubble_sort(&prc)
        sorted = false
        new_array = self.dup

        while !sorted
            sorted = true

            (0...new_array.length - 1).each do |i|
                if prc.call(new_array[i], new_array[i + 1]) == 1
                    new_array[i], new_array[i + 1] = new_array[i + 1], new_array[i]
                    sorted = false
                end
            end
        end

        new_array
    end
end

def substrings(str)
    substrings_array = []
    (0...str.length).each do |i|
        (0...str.length).each do |j|
            substrings_array << str[i..j] if i <= j
        end
    end
    substrings_array
end

def subwords(word)
    dictionary = File.readlines("dictionary.txt")
    substrings_array = substrings(word)
    substrings_array.select { |substring| dictionary.include?(substring + "\n") }
end