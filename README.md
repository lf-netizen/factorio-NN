# MNIST Classification in Factorio

<p align="center">
   <img src="img/factorioNN.gif" width=70%>
</p>

It began with an interesting input design in Factorio.

But first, let me introduce the game. Factorio is a construction and management simulation video game in which you build and maintain factories. It's one of those games where required resources and the advancement of production methods grow exponentially, so there's almost infinite amount of work to do at all stages of the game. To keep the factory running without major dips in production is challenging. Among its various mechanics it allows to build advanced circut networks to control your factory (before you ask, of course someone has re-created [Doom](https://www.youtube.com/watch?v=0bAuP0gO5pc) in it). 

Funnily enough, if you happen to be a programmer of any kind and spend some time with the game you would conclude that there is no difference between coding and playing Factorio. The system design patterns, various ideas about distributing resources, the scaling of a system, observing unexpected behaviour along with increasing complexity - you name it. Discovering so many parallels across a wide range of abstraction levels is extremely satisfying. Perhaps more about it [here](https://www.reddit.com/r/factorio/comments/rspj58/why_so_many_programmers/). There is a decent number of ideas I wanna try that directly correspond to some real-world (potential) solutions. It's a brilliant game and I cannot recommend it enough.

Back to the project. After classifying handwritten digits from the MNIST dataset, which is a fairly standard introduction to machine learning (with [this](https://www.youtube.com/playlist?list=PLQVvvaa0QuDfhTox0AjmQ6tvTgMBZBEXN) series, by the way) for some reason I had that clever design idea of an interactive 'whiteboard' in Factorio, which allows you to draw anything with your mouse directly. Something clicked in my head - it would be great to use it as a real test of a model I've trained. So I built a neural net with two dense layers, 32 neurons each. If you're familiar with the basics of electronics, the net itself is quite simple to design.

<p align="center">
   <img src="img/NNarch.png" width=90%>
</p>

A bit of an issue was that the cirut network operates only on signed 32-bit integers, so to keep the precision within reasonable range and avoid overflow it was necessary to scale down the outputs of each dense layer. In order to load the parameters into the game's memory cells I wrote a simple script in Lua.

After initial experiments I concluded that the net does not perform well on some kinds of inputs - e.g. the ones that do not fill the majority of the input whiteboard or those who lean more to the side. For me it was clear that it is necessary to add such examples to the training set - that way I sort-of discovered data augmentation on my own. 

With some trail and error I managed to uplift the performance of a net. Now I'm glad with the results.