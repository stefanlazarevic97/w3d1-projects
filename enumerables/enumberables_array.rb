require "byebug"

class Array
    def my_each(&prc)
        i = 0
        
        while i < self.length
            prc.call(self[i])
            i += 1
        end

        self
    end

    def my_select(&prc)
        new_array = []
        self.my_each { |ele| new_array << ele if prc.call(ele) }
        new_array
    end

    def my_reject(&prc)
        new_array = []
        self.my_each { |ele| new_array << ele if !prc.call(ele) }
        new_array
    end

    def my_any?(&prc)
        new_array = []
        self.my_each { |ele| new_array << ele if prc.call(ele) }
        new_array.length > 0
    end

    def my_all?(&prc)
        new_array = []
        self.my_each { |ele| new_array << ele if prc.call(ele) }
        new_array.length == self.length
    end

    def my_flatten
        flattened_array = []
        self.my_each { |ele| ele.is_a?(Array) ? flattened_array += ele.my_flatten : flattened_array << ele }
        flattened_array
    end

    def my_zip(*args)
        zipped_array = []
        i = 0

        self.my_each do |ele|
            ele == nil ? temp = [nil] : temp = [ele]
            args.my_each { |arg| arg[i] == nil ? temp << nil : temp << arg[i] }
            zipped_array << temp
            i += 1
        end
            
        zipped_array
    end

    def my_rotate(rotations = 1)
        rotated_array = Array.new(self.length)
        i = 0

        self.my_each do |ele|
            new_index = (i + self.length - rotations) % self.length
            rotated_array[new_index] = ele
            i += 1
        end
        
        rotated_array
    end

    def my_join(separator = "")
        string = ""
        self.my_each { |ele| string += ele + separator }
        string[-1] = "" if separator != ""
        string
    end

    def my_reverse
        reversed_array = Array.new{self.length}
        i = 0

        self.my_each do |ele|
            reversed_array[self.length - 1 - i] = ele
            i += 1
        end

        reversed_array
    end

end