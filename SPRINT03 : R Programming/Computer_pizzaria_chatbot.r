# Pizza restaurant Chat bot
pizzaria_chatbot <- function()
{
    print("Welcome to computer pizzaria!")
        menu_dish <- c("Peperoni", "Hawaiian", "Seafood", "Vegetarian")
        price_dish <- c(400, 300, 600, 500)
        menu_sidedish <- c("Salad", "Fried Chicken", "Spaghetti")
        price_sidedish <- c(200, 350, 400)
        menu_drinks <- c("Coke", "Green tea", "Milk", "Water")
        price_drinks <- c(100, 150, 200, 80)

        print("---Please see our menu---")
        ##Create dataframe
        df.menu_dish <- data.frame(menu_dish, price_dish)
        df.menu_sidedish <- data.frame(menu_sidedish, price_sidedish)
        df.menu_drinks <- data.frame(menu_drinks, price_drinks)
        print(df.menu_dish)
        print(df.menu_sidedish)
        print(df.menu_drinks)

        ##create menu_dish vector order
        vector_order <- c()
        while(TRUE)
        {
            flush.console()
            order <- readline("Which menu_dish will you order? (type 'no' to reject!) : ")
            if (sum(order == menu_dish[1:4]) >= 1)
            {
            vector_order <- append(vector_order, order)
            }else if ((sum(order == menu_dish[1:4]) == 0) & (order != "no"))
            {
                print("Invalid value, please fill again")
            }else
            {
            print("OK, What about side dish?")
            break
            }
        }
        ##create menu_sidedish vector order
        vector_sidedish_order <- c()
        while(TRUE)
        {
            flush.console()
            sidedish_order <- readline("Which menu_sidedish will you order? (type 'no' to reject!) : ")
            if (sum(sidedish_order == menu_sidedish[1:3]) >= 1)
            {
            vector_sidedish_order <- append(vector_sidedish_order, sidedish_order)
            }else if ((sum(sidedish_order == menu_sidedish[1:3]) == 0) & (sidedish_order != "no"))
            {
                print("Invalid value, please fill again")
            }else
            {
            print("OK, and what about drinks? ")
            break
            }
        }
        ##create menu_drinks vector order
        vector_drinks_order <- c()
        while(TRUE)
        {
            flush.console()
            drinks_order <- readline("Which menu_drinks will you order? (type 'no' to reject!) : ")
            if (sum(drinks_order == menu_drinks[1:4]) >= 1)
            {
            vector_drinks_order <- append(vector_drinks_order, drinks_order)
            }else if ((sum(drinks_order == menu_drinks[1:4]) == 0) & (drinks_order != "no"))
            {
                print("Invalid value, please fill again")
            }else
            {
            print("OK!")
            break
            }
        }


        ##total price
        names(price_dish) <- menu_dish
        names(price_sidedish) <- menu_sidedish
        names(price_drinks) <- menu_drinks

        print("Summary of your orders")
        print(price_dish[vector_order])
        print(price_sidedish[vector_sidedish_order])
        print(price_drinks[vector_drinks_order])

        sum_dish_price <- sum(price_dish[vector_order])
        sum_sidedish_price <- sum(price_sidedish[vector_sidedish_order])
        sum_drinks_price <- sum(price_drinks[vector_drinks_order])

        print(paste("all main dish price : ", sum_dish_price))
        print(paste("all side dish price : ", sum_sidedish_price))
        print(paste("all drinks price : ", sum_drinks_price))

        total_dish_price <- sum(price_dish[vector_order]) + sum(price_sidedish[vector_sidedish_order]) + sum(price_drinks[vector_drinks_order])
        print(paste("total price : ", total_dish_price, "Baht"))

        print("THANK YOU")
}
pizzaria_chatbot()
