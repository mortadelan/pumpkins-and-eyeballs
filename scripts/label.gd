extends Label

var score : int = 0

func update(add_score = 20):
	score += add_score
	text = "Score: " + str(score)
