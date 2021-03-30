An experiment in solving VRPTW using ORTools and DEAP
This should be Readme.MD, and I could link to this README.MD from my blog.
NAAH. I should stick to my blog, link to my blog from the readme. And on the readme I should put technical information, etc.

# Goal
In a previous essay I wrote
> "we haven’t yet found a good alternative to traditional analytical techniques like mathematical programming when rules are clear and data input is of good quality" ...
> "search spaces have grown so big that we might need some ML to narrow down potential areas within which to search for solutions to improve performance."
----
1. My goal is to try out DEAP and ORtools on something that wasn't a toy problem. 
2. Put this in the context of ML - randomness is a good place to explore learning
3. Set what the goals are not: not to reach optimality, not to have a great performance
----
# High level design 
* GA is not going to be great at sequencing. better to use it for partitioning
* Use CP for sequencing. Why? I don't know - I just like the idea. A better approach would be to use a well tested heuristic like LKH (potentially my next step), but for now this is fine.
* GA partitions the nodes; CP sequences it; the final evaluation chooses the better partitions
----
# Medium level design
* Going for a full GA + full routing: way too slow, high chance of GA missing good moves.
* better idea to do a LNS by only running a few routes at a time
* also good idea to do increasing sizes / depth (more iterations)

----
# Tricky bits
* I'm using DEAP and SAT as black boxes; so if sometimes the 'min' score jumped up or if SAT printed some infeasibility in the middle of an iteration, it was tricky to figure out what I got wrong
* multi-threading
* Comparison of open source tools for solving the routing problem: CP Sat was approximate but still fast. The routing solver could have been faster but I wanted to allow infeasibilities with some penalties, and wasn't sure how to model that.
* (might need to go through the code to understand more tricky bits.) + add comments + clean up + push to github
* Add link to github repo here
* Add MIT license
* The dread of seeing the GA go for several hundred iterations without finding an improvement when you know you're so far off the best-known solution

----
# Results
* within 5% of the 3 major classes, R, C, RC. Only ran for selected problems.
* Performance was... bad. I would not propose this for real world use.
* What I learned: for all the flexibility and promise of GAs, they still don't match a heuristic or analytical technique (really?)
* 