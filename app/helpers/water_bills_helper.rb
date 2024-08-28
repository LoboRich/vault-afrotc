module WaterBillsHelper
    AMOUNT_PER_CUBIC_METER = [
        {cubic: 0, amount: 50.00},
        {cubic: 1, amount: 208.00},
        {cubic: 2, amount: 208.00},
        {cubic: 3, amount: 208.00},
        {cubic: 4, amount: 208.00},
        {cubic: 5, amount: 208.00},
        {cubic: 6, amount: 208.00},
        {cubic: 7, amount: 208.00},
        {cubic: 8, amount: 208.00},
        {cubic: 9, amount: 208.00},
        {cubic: 10, amount: 208.00},
        {cubic: 11, amount: 235.40},                 
        {cubic: 12, amount: 256.80},
        {cubic: 13, amount: 278.20},
        {cubic: 14, amount: 299.60},
        {cubic: 15, amount: 321.00},
        {cubic: 16, amount: 342.40},
        {cubic: 17, amount: 363.80},
        {cubic: 18, amount: 385.20},
        {cubic: 19, amount: 406.60},
        {cubic: 20, amount: 428.00},
        {cubic: 21, amount: 477.75},
        {cubic: 22, amount: 500.50},
        {cubic: 23, amount: 523.25},
        {cubic: 24, amount: 546.00},
        {cubic: 25, amount: 568.75},
        {cubic: 26, amount: 591.50},
        {cubic: 27, amount: 614.25},
        {cubic: 28, amount: 637.00},
        {cubic: 29, amount: 659.75},
        {cubic: 30, amount: 682.50},
    ]

    def check_amount_per_cubic(cubic)
        entry = AMOUNT_PER_CUBIC_METER.find { |x| x[:cubic] == cubic }
        entry ? entry[:amount] : nil
    end
end
