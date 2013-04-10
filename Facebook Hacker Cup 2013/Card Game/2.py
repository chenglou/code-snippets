import math

def totalNumberOfHands(totalNumberOfCards, numberOfCardsInOneHand):
    return math.factorial(totalNumberOfCards) / math.factorial(totalNumberOfCards - numberOfCardsInOneHand) / math.factorial(numberOfCardsInOneHand)


fin = open('card_game.txt', 'r')
fout = open('output.txt', 'w')

numberOfCases = int(fin.readline().strip())

lineCount = 1
for i in range(0, numberOfCases):
    lineWithNAndK = fin.readline().strip().split(" ")
    totalNumberOfCards = int(lineWithNAndK[0])
    numberOfCardsInOneHand = int(lineWithNAndK[1])

    cardsArray = fin.readline().strip().split(" ")
    cardsArray = [int(number) for number in cardsArray]
    cardsArray.sort(reverse = True)

    initialNumberOfHands = totalNumberOfHands(totalNumberOfCards, numberOfCardsInOneHand)
    numberOfRemainingHands = initialNumberOfHands

    totalValue = 0
    currentHighValueIndex = 0
    numberOfCardsInOneHand -= 1

    while totalNumberOfCards > numberOfCardsInOneHand:
        totalNumberOfCards -= 1
        totalValue += cardsArray[currentHighValueIndex] * totalNumberOfHands(totalNumberOfCards, numberOfCardsInOneHand)

        currentHighValueIndex += 1

    fout.write("Case #%d: %d" %(lineCount, totalValue % 1000000007))
    if lineCount != numberOfCases:
        fout.write('\n')
    
    lineCount += 1
    
fin.close()
fout.close()