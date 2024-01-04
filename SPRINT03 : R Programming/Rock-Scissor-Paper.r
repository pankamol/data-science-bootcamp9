# this is R programming : Create Rock Scissor Paper game
game <- function()
{
    print("Hello, welcome to the game!")
    flush.console()
    username <- readline("Enter your name: ")
    print("Let's play :)")
    hands <- c("rock", "scissor", "paper")
    round_count <- 0
    human_point <- 0
    computer_point <- 0

    while(TRUE)
    {
        flush.console()
        human_hand <- readline("input: ")
        computer_hand <- sample(hands,1)
        print(computer_hand)
        round_count <- round_count + 1

        if (human_hand == "rock")
        {
            if (computer_hand == "rock"){
                human_point <- human_point + 0
                computer_point <- computer_point + 0
                print("TIE")
            }
            if (computer_hand == "scissor"){
                human_point <- human_point + 1
                computer_point <- computer_point + 0
                print("YOU WIN")
            }
            if (computer_hand == "paper"){
                human_point <- human_point + 0
                computer_point <- computer_point + 1
                print("YOU LOSE")
            }
        }
        else if (human_hand == "scissor")
        {
            if (computer_hand == "rock"){
                human_point <- human_point + 0
                computer_point <- computer_point + 1
                print("YOU LOSE")
            }
            if (computer_hand == "scissor"){
                human_point <- human_point + 0
                computer_point <- computer_point + 0
                print("TIE")
            }
            if (computer_hand == "paper"){
                human_point <- human_point + 1
                computer_point <- computer_point + 0
                print("YOU WIN")
            }
        }
        else if (human_hand == "paper")
        {
            if (computer_hand == "rock"){
                human_point <- human_point + 1
                computer_point <- computer_point + 0
                print("YOU WIN")
            }
            if (computer_hand == "scissor"){
                human_point <- human_point + 0
                computer_point <- computer_point + 1
                print("YOU LOSE")
            }
            if (computer_hand == "paper"){
                human_point <- human_point + 0
                computer_point <- computer_point + 0
                print("TIE")
            }
        }
        else
        {
            print("Invalid input, please try again")
        }
        while(TRUE)
        {
        flush.console()
        play_again <- readline("Do you want to play again? (yes/no): ")

            if (play_again == "no" | play_again == "yes")
            {
                break
            }
        }
        if (play_again == "no")
        {
            break
        }


    }
    print("Game Over!")
    print(paste("Total round : ", round_count))
    print(paste("FINAL SCORE",username ,":",human_point , "Computer :", computer_point ))

    if(human_point > computer_point)
    {
        print("YOU WIN")
    }
    else if(human_point < computer_point)
    {
        print("You LOSE")
    }else
    {
        print("TIE")
    }
}

game()
