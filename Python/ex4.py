hour_init = int (input ("Hour begin: "))
mini_init = int (input ("Mini begin: "))

hour_end = int (input("Hour end: "))
mini_end = int (input("Mini end: "))

k = (hour_end * 60 + mini_end) - (hour_init * 60 + mini_init)

if k < 0:
	k = k + 24 * 60

hour = int (k / 60)
mini = k % 60

print ("Hour: ", hour, " Mini: ", mini)
