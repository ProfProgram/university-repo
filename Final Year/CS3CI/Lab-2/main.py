import pandas as pd
from lib import tsp

###############################################################################
# Step 1
###############################################################################

adjacency_matrix = [
  [0,20,42,35],
  [20,0,30,34],
  [42,30,0,12],
  [35,34,12,0]
]
small_tsp_instance = tsp.construct(adjacency_matrix)
tsp.display_instance(small_tsp_instance,label_edges=True,title="4-city TSP Instance")

###############################################################################
# Step 2
###############################################################################

test_route = [0,1,2,3,0]
test_route_cost = tsp.evaluate(small_tsp_instance,test_route)
tsp.display_route(small_tsp_instance,test_route,label_edges=True,
  title="Manually defined route on the 4-city TSP Instance\n" + 
  "Cost: {}".format(test_route_cost))

###############################################################################
# Step 3
####################################################################
random_route = tsp.random_route(small_tsp_instance)
random_route_cost = tsp.evaluate(small_tsp_instance, random_route)
tsp.display_route(small_tsp_instance,random_route,label_edges=True,
                    title="Random route on the 4-city TSP Instance.\n" + 
                      "Cost: {}".format(random_route_cost))

###############################################################################
# Step 4
###############################################################################
ulysses16_coords = pd.read_csv('ulysses16.csv',header=0).values
ulysses16_tsp_instance = tsp.construct_from_city_coords(ulysses16_coords)

# As we have the (x,y) coordinates of the cities for the Ulysses16 problem, we
# can pass them to the display function to position the cities correctly when
# they are displayed.
ulysses16_route = tsp.random_route(ulysses16_tsp_instance)
ulysses16_route_cost = tsp.evaluate(ulysses16_tsp_instance, ulysses16_route)
tsp.display_route(
  ulysses16_tsp_instance,ulysses16_route,
  city_coords=ulysses16_coords,
  title="Random route on the Ulysses16 TSP Instance.\n" +
    "Cost: {}".format(ulysses16_route_cost)
)

###############################################################################
# Lab 2
###############################################################################

###############################################################################
# Step 2
###############################################################################

import time

start_time = time.time()
target_time = 10

def random_search(tsp_instance, target_time):
  best_route = None
  best_cost = float('inf')
  start_time = time.time()
  while time.time() - start_time < target_time:
    route = tsp.random_route(tsp_instance)
    cost = tsp.evaluate(tsp_instance, route)
    if cost < best_cost:
      best_cost = cost
      best_route = route
    return best_route, best_cost


t1 = random_search(ulysses16_tsp_instance, target_time)
# Initial run with 10 sec found cost of 153.27
t2 = random_search(ulysses16_tsp_instance, target_time+10)
# Double duration found cost of 158.86, longer did not improve algorithm performance
# likely due to random nature of algorithm
t3 = random_search(ulysses16_tsp_instance, target_time+20)
# Triple duration found cost of 144.96, substantial improvement
# further runs need to be made to conclude reliability of improvement from triple duration

print("Step 2:")
print(f"t1: {t1}")
print(f"t2: {t2}")
print(f"t3: {t3}")

# multiple runs show consistent improvement with triple duration and failure for double duration
# at least in cases of up to 3 runs

###############################################################################
# Step 3
###############################################################################

import copy

def city_swap_neighbourhood(route):
  # Randomly select two cities to swap, cannot select city index[0] or [length()-1]
  # Return a neighbourhood of all possible routes with the two cities swapped

    neighbourhood = []

    for i in range(1, len(route) - 1):
        for j in range(i + 1, len(route) - 1):
            new_route = copy.deepcopy(route)

            new_route[i], new_route[j] = new_route[j], new_route[i]

            neighbourhood.append(new_route)

    return neighbourhood

t1 = city_swap_neighbourhood([0, 1, 2, 3, 4, 0])

# Testing city_swap_neighbourhood function with example from 'Local Search Task.pdf'
print(f"Step 3: t1: {t1}\nt1.length: {len(t1)}")

###############################################################################
# Step 4
###############################################################################

def best_neighbour_step(tsp_instance, neighbourhood):
  best_neighbour = None
  best_cost = float('inf')

  for neighbour in neighbourhood:
    cost = tsp.evaluate(tsp_instance, neighbour)
    if cost < best_cost:
      best_cost = cost
      best_neighbour = neighbour

  return best_neighbour, best_cost

t1 = best_neighbour_step(ulysses16_tsp_instance, city_swap_neighbourhood(ulysses16_route))

print(f"Step 4: t1: {t1}")

###############################################################################
# Step 5
###############################################################################

def local_search(tsp_instance, target_time):
  best_route = tsp.random_route(tsp_instance)
  best_cost = tsp.evaluate(tsp_instance, best_route)
  start_time = time.time()

  while time.time() - start_time < target_time:
    neighbourhood = city_swap_neighbourhood(best_route)
    neighbour, cost = best_neighbour_step(tsp_instance, neighbourhood)

    if cost < best_cost:
      best_cost = cost
      best_route = neighbour
    else:
      break

  return best_route, best_cost

target_time = 10

t1 = local_search(ulysses16_tsp_instance, target_time)

t2 = local_search(ulysses16_tsp_instance, target_time + 10)

t3 = local_search(ulysses16_tsp_instance, target_time + 20)

print("Step 5:")
print(f"t1: {t1}")
print(f"t2: {t2}")
print(f"t3: {t3}")

# Shows similar improvement with regard to duration as random search
# finds much lower cost than random search across all durations

###############################################################################
# Step 6
###############################################################################

# Novel Variant : TABU search (https://www.geeksforgeeks.org/dsa/what-is-tabu-search/)

def tabu_search(tsp_instance, target_time):

  # Initialize tabu variables
  start_time = time.time()
  current_route = tsp.random_route(tsp_instance)
  best_route = copy.deepcopy(current_route)
  best_distance = tsp.evaluate(tsp_instance, best_route)
  tabu_list = []
  max_tabu_length = 5

  # modified best_neighbour_step to account for tabu list and best overall solution
  def best_tabu_neighbour_step(current_route, neighbourhood):

    # Initialize local method variables
    best_neighbour = None
    best_neighbour_cost = float('inf')
    best_move = None

    for neighbour in neighbourhood:

      # Identify which two cities were swapped
      for i in range(1, len(current_route) - 1):
        for j in range(i + 1, len(current_route) - 1):
          if (current_route[i] == neighbour[j] and current_route[j] == neighbour[i]):
            move = (i, j)
            break
          else:
            continue
        break

      neighbour_cost = tsp.evaluate(tsp_instance, neighbour)

      # Ignore tabu moves unless they improve the global best
      if move in tabu_list and neighbour_cost >= best_distance:
        continue

      # Find the best allowed neighbour
      if neighbour_cost < best_neighbour_cost:
        best_neighbour = neighbour
        best_neighbour_cost = neighbour_cost
        best_move = move

    return best_neighbour, best_neighbour_cost, best_move

  # starting main loop
  while time.time() - start_time < target_time:

    neighbourhood = city_swap_neighbourhood(current_route)
    best_neighbour, best_neighbour_cost, best_move = best_tabu_neighbour_step(
        current_route, neighbourhood)

    # Stop if no available neighbour exists
    if best_neighbour is None:
      break

    # Move to the best available neighbour
    current_route = copy.deepcopy(best_neighbour)

    # Add the selected move to the tabu list
    tabu_list.append(best_move)

    # Remove the oldest tabu move when the list is too large
    if len(tabu_list) > max_tabu_length:
      tabu_list.pop(0)

    # Update the best overall solution
    if best_neighbour_cost < best_distance:
      best_route = copy.deepcopy(best_neighbour)
      best_distance = best_neighbour_cost

  return best_route, best_distance
