class SMSController < ApplicationController
  def initialize(phoneNum,smsText)
    @@phoneNum = phoneNum
    @@smsText = smsText
  end

  @@t_bin =
    {
    "0000" => "0",
    '0001' => '1',
    '0010' => '2',
    '0011' => '3',
    '0100' => '4',
    '0101' => '5',
    '0110' => '6',
    '0111' => '7',
    '1000' => '8',
    '1001' => '9',
    '1010' => 'A',
    '1011' => 'B',
    '1100' => 'C',
    '1101' => 'D',
    '1110' => 'E',
    '1111' => 'F'
    }

  @@bit7 =
    {
      "0000000" => "@",
      "0000001" => "£",
      "0000010" => "$",
      "0000011" => "¥",
      "0000100" => "è",
      "0000101" => "é",
      "0000110" => "ù",
      "0000111" => "ì",
      "0001000" => "ò",
      "0001001" => "Ç",
      "0001010" => "\r",
      "0001011" => "Ø",
      "0001100" => "ø",
      "0001101" => "\n\r",
      "0001110" => "Å",
      "0001111" => "å",
      "0010000" => "∆",
      "0010001" => "_",
      "0010010" => "ﬁ",
      "0010011" => "GAMMA",
      "0010100" => "LAMBDA",
      "0010101" => "Ω",
      "0010110" => "π",
      "0010111" => "PSI",
      "0011000" => "∑",
      "0011001" => "THETA",
      "0011010" => "XI",
      "0011011" => "\n",
      "0011100" => "Æ",
      "0011101" => "æ",
      "0011110" => "ß",
      "0011111" => "É",
      "0100000" => " ",
      "0100001" => "!",
      "0100010" => "\"",
      "0100011" => "#",
      "0100100" => "¢",
      "0100101" => "%",
      "0100110" => "&",
      "0100111" => "\'",
      "0101000" => "(",
      "0101001" => ")",
      "0101010" => "*",
      "0101011" => "+",
      "0101100" => ",",
      "0101101" => "-",
      "0101110" => ".",
      "0101111" => "/",
      "0110000" => "0",
      "0110001" => "1",
      "0110010" => "2",
      "0110011" => "3",
      "0110100" => "4",
      "0110101" => "5",
      "0110110" => "6",
      "0110111" => "7",
      "0111000" => "8",
      "0111001" => "9",
      "0111010" => ":",
      "0111011" => ",",
      "0111100" => "<",
      "0111101" => "=",
      "0111110" => ">",
      "0111111" => "?",
      "1000000" => "¡",
      "1000001" => "A",
      "1000010" => "B",
      "1000011" => "C",
      "1000100" => "D",
      "1000101" => "E",
      "1000110" => "F",
      "1000111" => "G",
      "1001000" => "H",
      "1001001" => "I",
      "1001010" => "J",
      "1001011" => "K",
      "1001100" => "L",
      "1001101" => "M",
      "1001110" => "N",
      "1001111" => "O",
      "1010000" => "P",
      "1010001" => "Q",
      "1010010" => "R",
      "1010011" => "S",
      "1010100" => "T",
      "1010101" => "U",
      "1010110" => "V",
      "1010111" => "W",
      "1011000" => "X",
      "1011001" => "Y",
      "1011010" => "Z",
      "1011011" => "Ä",
      "1011100" => "Ö",
      "1011101" => "N",
      "1011110" => "Ü",
      "1011111" => "§",
      "1100000" => "?",
      "1100001" => "a",
      "1100010" => "b",
      "1100011" => "c",
      "1100100" => "d",
      "1100101" => "e",
      "1100110" => "f",
      "1100111" => "g",
      "1101000" => "h",
      "1101001" => "i",
      "1101010" => "j",
      "1101011" => "k",
      "1101100" => "l",
      "1101101" => "m",
      "1101110" => "n",
      "1101111" => "o",
      "1110000" => "p",
      "1110001" => "q",
      "1110010" => "r",
      "1110011" => "s",
      "1110100" => "t",
      "1110101" => "u",
      "1110110" => "v",
      "1110111" => "w",
      "1111000" => "x",
      "1111001" => "y",
      "1111010" => "Z",
      "1111011" => "ä",
      "1111100" => "ö",
      "1111101" => "ñ",
      "1111110" => "ü",
      "1111111" => "à",
      }

  def getsms
    @phone = params[:phone]
    @text = params[:text]
    @converter= Iconv.new('UTF-8','UTF-16BE')
    # Converts text to unicode language making languages, such as Japanese, readable.
    @ut = @converter.iconv(@text.to_s)
    sendSMS(:phone => @phone,:smstext => @ut)
  end

   def sendSMS()
    	createSMS(@@phoneNum,@@smsText)
   end
    
  def createSMS(phoneNum,smsText)
      @phone_num = phoneNum
      @sms_msg = smsText
  end

end