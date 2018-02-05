require 'date'
require 'pry'

# KeyGenerator for first part of encryption process.
class KeyGenerator
  attr_reader :key_gen

  def initialize
    @key_gen = rand(10_000..99_999)
  end

  def key_offset
    key_offset = @key_gen.to_s.split('')
    @key_offsets = {
      a: key_offset[0..1].join.to_i,
      b: key_offset[1..2].join.to_i,
      c: key_offset[2..3].join.to_i,
      d: key_offset[3..4].join.to_i
    }
  end
end

# DateOffset for second part of encryption process.
class DateGenerator
  attr_reader :date,
              :integer_date

  def initialize
    @date = DateTime.now
  end

  def integer_date
    @integer_date = @date.strftime('%d%m%y').to_i
  end

  def integer_date_squared
    @integer_date = @date.strftime('%d%m%y').to_i
    @squared_date = @integer_date ** 2
  end

  def date_offset
    date_offset = @squared_date[@squared_date.length - 4 ,4]
  end

end
