#!/usr/bin/env python3

"""
Polystock
Author: Ashar Latif
Date: 2021-06-09
Description: A ticker displayer for polybar.
Contact: ashar.k.latif@gmail.com
"""

from datetime import datetime
from datetime import time
from datetime import timedelta
import argparse

from yahoo_fin import stock_info as si

import symbols

DEBUG = 0

# How many decimal place to show in stock price.
ROUND_NUMBER = 2

# Color definitions
TICKER_NAME_COLOR = '#fa83aa'
POSITIVE_PERCENTAGE_COLOR = '#05fc15'
NEGATIVE_PERCENTAGE_COLOR = '#fc0511'

# Market Times
PREMARKET_OPEN = time(4,0)
MARKET_OPEN = time(9,30)
MARKET_CLOSE = time(16,0)
POSTMARKET_CLOSE = time(20,0)

closed_days = ['05/31/2021']


def biggestloser():
    """Returns: stock with the the biggest losses in a given day and
    its stock price with format: 'TICKER': 'PRICE'."""

    day_losers = si.get_day_losers()
    output = str(day_losers.at[0, 'Symbol']) + ': ' + \
             str(round(si.get_live_price(day_losers.at[0, 'Symbol']), ROUND_NUMBER))
    return output

def biggestgainer():
    """Returns: stock with the biggest gains in a given day and
    its stock price with format: 'TICKER': 'PRICE'."""

    day_gainer = si.get_day_gainers()
    output = str(day_gainer.at[0, 'Symbol']) + ': ' + \
             str(round(si.get_live_price(day_gainer.at[0, 'Symbol']), ROUND_NUMBER))
    return output

def mostactive():
    """Returns: stock with the most activity in a given day and
    its stock price with format: 'TICKER': 'PRICE'."""

    day_active = si.get_day_most_active()
    output = str(day_active.at[0, 'Symbol']) + ': ' + \
             str(round(si.get_live_price(day_active.at[0, 'Symbol']), ROUND_NUMBER))
    return output

def topcrypto():
    """Returns: cryptocurrency with the highest price in a given day and its name
    with format: 'CRYPTO': 'PRICE'."""

    top_crypto = si.get_top_crypto()
    output = str(top_crypto.at[0, 'Symbol']) + ': ' + \
             str(round(si.get_live_price(top_crypto.at[0, 'Symbol']), ROUND_NUMBER))
    return output

def is_trading_hours():
    """Returns: Status of North American markets"""
    if DEBUG:
        print("Checking trading hour status")
    now = datetime.now().time()
    day = datetime.now().weekday()
    if day in range (0,5):
        if MARKET_OPEN > now >= PREMARKET_OPEN:
            market_status = "PREMARKET"
        elif MARKET_CLOSE > now >= MARKET_OPEN:
            market_status = "MARKET_OPEN"
        elif POSTMARKET_CLOSE > now >= MARKET_CLOSE:
            market_status = "POSTMARKET"
        else:
            market_status = "MARKET_CLOSED"
    else:
        market_status = "MARKET_CLOSED"
    if DEBUG:
        print("Current time: " + str(now))
        print("Market status: " + str(market_status))
    return market_status

def last_trading_day():
    now = datetime.now()
    now = now - timedelta(days = 1)
    start = now.strftime("%m") + '/' + str(int(now.strftime("%d"))).zfill(2) + '/' + now.strftime("%Y")
    while ((now.weekday() in range (5,7)) or (start in closed_days)):
        now = now - timedelta(days = 1)
        start = now.strftime("%m") + '/' + str(int(now.strftime("%d"))).zfill(2) + '/' + now.strftime("%Y")
    if DEBUG:
        print("Last trading day: " + start)
    return str(start)

def gain_loss(ticker, today):
    """Returns: Colorized directional percentage movement of the ticker"""
    if DEBUG:
        print("Starting gain_loss function")
    start = last_trading_day()
    yesterday = si.get_data(ticker, start_date = start).iloc[0]['close']
    if DEBUG:
        print("Last close: " + str(yesterday))
    percentage = round(((100 * today) / yesterday) - 100, 2)
    if DEBUG:
        print("Percentage move:" + str(percentage))
    if percentage >= 0:
        color = POSITIVE_PERCENTAGE_COLOR
    elif percentage < 0:
        color = NEGATIVE_PERCENTAGE_COLOR
    return str('%{F' + color + '}' + str(percentage) + '%' + '%{F-}')

def customticker(ticker):
    """Returns: stock price and ticker of a stock with format 'TICKER': 'PRICE'.
    Parameter: the ticker to get a stock price on and to display.
    Precondition: ticker is a string."""
    ticker_price = si.get_live_price(ticker)
    percentage = gain_loss(ticker, ticker_price)
    output = ticker + ': ' + str(round(ticker_price, ROUND_NUMBER)) + percentage
    if DEBUG:
        print(str(output))
    return output

def ticker_parse(dictionary):
    """Returns: stock price and ticker of a stock with format 'TICKER': 'PRICE'.
    Parameter: the ticker to get a stock price on and to display.
    Precondition: ticker is a string."""
    stocks = ""
    if DEBUG:
        print("Starting ticker_parse function")

    market_status = is_trading_hours()

    for key in dictionary:
        if dictionary[key]["type"] != "stocks":
            ticker_price = si.get_live_price(dictionary[key]["ticker"])
        elif dictionary[key]["type"] == "stocks":
            if market_status == "PREMARKET":
                ticker_price = si.get_premarket_price(dictionary[key]["ticker"])
            elif market_status == "POSTMARKET":
                ticker_price = si.get_postmarket_price(dictionary[key]["ticker"])
            else:
                ticker_price = si.get_live_price(dictionary[key]["ticker"])
        if DEBUG:
            print(str(key) + ': ' + str(ticker_price))
        percentage = gain_loss(dictionary[key]["ticker"], ticker_price)
        formatted_key = str('%{F' + TICKER_NAME_COLOR + '}' + key + '%{F-}')
        output = formatted_key + ': '  + str(round(ticker_price, ROUND_NUMBER)) + \
                 ' ' + str(percentage) + ' | '
        if DEBUG:
            print(output)
        stocks += output
    if DEBUG:
        print(stocks)
    stocks += market_status
    return stocks

def parse_arguments():
    """Adds arguments from ArgParse and parses them to handle arguments"""

    parser = argparse.ArgumentParser(description='Displays stock prices for polybar.',
                                     epilog='Output will always be in the format of: \
                                     Biggest Loser, Biggest Gainer, Most Active, \
                                     Top Crypto, Custom Ticker')

    # add arguments to be called
    parser.add_argument('--biggestloser',
                        help='Prints the stock with the biggest drop in a given day.',
                        action='store_true')
    parser.add_argument('--biggestgainer',
                        help='Prints the stock with the biggest gain in a given day.',
                        action='store_true')
    parser.add_argument('--mostactive',
                        help='Prints the most active stock in a given day.',
                        action='store_true')
    parser.add_argument('--topcrypto',
                        help='Prints the top cryptocurrency by market cap in a given day.',
                        action='store_true')
    parser.add_argument('--customticker',
                        help='Display the price of a custom ticker.',
                        type=str)
    parser.add_argument('--mytickers',
                        help='Display the price of my tickers.',
                        action='store_true')
    parser.add_argument('--getgroup',
                        help='Display the price of selected equties.',
                        action='store_true')
    args = parser.parse_args()

    stocks = ""

    try:
        # parse arguments
        if args.biggestloser:
            stocks += " " + biggestloser() + " "
        if args.biggestgainer:
            stocks += " " + biggestgainer() + " "
        if args.mostactive:
            stocks += " " + mostactive() + " "
        if args.topcrypto:
            stocks += " " + topcrypto() + " "
        if args.customticker:
            stocks += " " + customticker(args.customticker) + " "
        if args.mytickers:
            stocks += " " + customticker("GME") + " "
        if args.getgroup:
            stocks += " " + ticker_parse(symbols.SYMBOLS)

    except:
        stocks = " "

    if stocks == "":
        print("You must choose a stock to be displayed! Use --help for more details...")
    else:
        print(stocks)

if __name__ == '__main__':
    parse_arguments()
