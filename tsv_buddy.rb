# frozen_string_literal: true

# Module that can be included (mixin) to take and output TSV data
module TsvBuddy
  # Converts a String with TSV data into internal data structure @data
  # arguments: tsv - a String in TSV format
  # returns: nothing
  def take_tsv(tsv)
    # read tsv data
    lines_arr = tsv.split("\n").map do |line|
      line.split("\t")
    end

    # convert tsv data into array of hashs
    key_arr = lines_arr[0]
    tsv_arr = lines_arr[1..].map do |value|
      key_arr.zip(value).to_h
    end

    @data = tsv_arr
  end

  # Converts @data into tsv string
  # arguments: none
  # returns: String in TSV format
  def to_tsv
    tsv_arr = []
    # push keys
    tsv_arr << @data[0].keys.join("\t")

    # push values
    @data.each do |hash|
      tsv_arr << hash.values.join("\t")
    end

    "#{tsv_arr.join("\n")}\n"
  end
end
