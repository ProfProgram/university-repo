### Notes written as my interpretation of instructions

## Step 1

Completed after importing lab1code.zip

## Step 2

local search algorithm

- Time-based termination (sec)
    - adherence to 10-sec limit given from 'Experimental Study: Lab Sign-off - Due 2 Nov 26' when submitted within notebook
- random search algorithm
- pass TSP instance
- store best generated so far
    - lower cost for same goal
    - 1 saved path per algorithm run
- return best tour + tour length
- Tested via ulysses16 TSP instance with different time limits
    - note effect when given more/less time

## Step 3

- Routes start and end with city '0'
- takes TSP route as input
- Find permutations of routes where from the original route a copy.deepcopy() is made for each permutation
- each permutation swaps the index positions of two cities within the original route, as city '0' must start and end the route we do not swap index[1] or index[length()]
- returns 'neighbouring_routes' which holds all city-swap-based neighbours of the original route

## Step 4

- evaluates routes from neighbourhood and returns 'shortest' one (least cost)
    - input = Step 3 neighbouthood

## Step 5

- Connect Steps 3 & 4 such that we generate a random route then find random neighbours, calculate shortest route then assign that as next current for continuous searching until termination
- Time limit termination
    - 10 sec as, reason as mentioned in Step 2
- Step has questions that can be answered in comments after running tests

## Step 6

- 'Novel Variant' of above search algorithms
- suggest '2-opt neighbourhood'
    - Ended up going with Tabu Search