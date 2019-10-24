from telegram.ext import Updater, InlineQueryHandler, CommandHandler
import requests
import re
import datetime

import time
import schedule


def get_url():
    contents = requests.get('https://random.dog/woof.json').json()
    url = contents['url']
    return url

def get_image_url():
    allowed_extension = ['jpg','jpeg','png']
    file_extension = ''
    while file_extension not in allowed_extension:
        url = get_url()
        file_extension = re.search("([^.]*)$",url).group(1).lower()
    return url

def comemora(bot, update):
    chat_id = update.message.chat_id
    currentDt = datetime.datetime.now()
    currentHour = int(currentDt.hour)
    msg = "Oi, calma que só faltam " + str(19 - currentHour) + " horas! + atrasos"
    bot.send_message(chat_id=chat_id, text=msg)

def mostrar(bot, update):
    url = get_image_url()
    chat_id = update.message.chat_id
    bot.send_photo(chat_id=chat_id, photo=url)


def report():
    my_balance = 10   ## Replace this number with an API call to fetch your account balance
    my_message = "Current balance is: {}".format(my_balance)   ## Customize your message
    telegram_bot_sendtext(my_message)


def main():
    updater = Updater('TOKEN')
    
    dp = updater.dispatcher
    dp.add_handler(CommandHandler('queroComer',comemora))
    dp.add_handler(CommandHandler('mostraImg', mostrar))

    ##schedule.every(1).minutes.do(report)

    ##while True:
      ##  schedule.run_pending()
       ## time.sleep(1)

    updater.start_polling()
    updater.idle()

   
if __name__ == '__main__':
    main()
