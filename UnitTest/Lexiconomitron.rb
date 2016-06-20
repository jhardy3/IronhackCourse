class Lexiconomitron

  def eat_t(input)
    input.tr!("t", "")
    input.tr("T", "")
  end

  def shazam(array)
    # reverse words
  array.map! { |e| e.reverse }
  [eat_t(array[0]), eat_t(array.last)]

  end

  def oompa_loompa(array)
    array.map! { |e| eat_t(e) }
    array.delete_if do |item|
      if item.chars.to_a.length > 3
        true
      else
        false
      end
    end

  end


end
