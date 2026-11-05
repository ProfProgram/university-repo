# For Step 3
import random

# For Step 4
import pandas as pd
import numpy as np



def build_adj_matrix_float(num_cities):
    adj_matrix = [
        [0.0 for _ in range(num_cities)]
        for _ in range(num_cities)
    ]
    return adj_matrix

def build_adj_matrix(num_cities):
    adj_matrix = [
        [0 for _ in range(num_cities)]
        for _ in range(num_cities)
    ]
    return adj_matrix

def calc_routes(n):
    print("Calculating the number of possible 2-way routes where each city connects to every other city ...")
    return n * (n - 1) // 2

def random_tsp(num_cities, min_cost=1, max_cost=100):
    """
    Generates a TSP for given city number with random costs between city
    Default min/max = 1/100
    Costs are symmetric

    Returns:
        adjacency_matrix: 2D list of costs between cities
    """
    adjacency_matrix = [
        [0 for _ in range(num_cities)]
        for _ in range(num_cities)
    ]

    print("Generating Routes ...")
    for i in range(num_cities):
        for j in range(i + 1, num_cities):
            cost = random.randint(min_cost, max_cost)
            adjacency_matrix[i][j] = cost
            adjacency_matrix[j][i] = cost

    return adjacency_matrix

def random_route(num_city):
    """
    Generate a random TSP route vising every city exactly once.
    """

    route = list(range(1, num_city))
    random.shuffle(route)

    return [0] + route

def evaluate_tsp(adjacency_matrix, route):
    """
    Evaluate the cost of a given TSP route based on the adjacency matrix.
    """
    total_cost = 0
    num_cities = len(route)

    for i in range(num_cities):
        from_city = route[i]
        to_city = route[(i + 1) % num_cities]  # '% num_cities' makes route circular 
        total_cost += adjacency_matrix[from_city][to_city]

    return total_cost

def get_routes(adjacency_matrix):
    routes = []

    for i in range(len(adjacency_matrix)):
        for j in range(i + 1, len(adjacency_matrix)):
            cost = adjacency_matrix[i][j]
            routes.append((i, j, cost))

    return routes

# ------------------------------
# MAIN PROGRAM - ALL OF LAB 1
# ------------------------------

# -------------------------------------
# Step 1: Data Structure for the Graph
# -------------------------------------

print("-"*50+"\n"+"Running Step 1: Data Structure for the Graph ...\n"+"-"*50+"\n")

adjacency_matrix = [
    [0, 20, 42, 35],
    [20, 0, 30, 34],
    [42, 30, 0, 12],
    [35, 34, 12, 0]
]

routes = get_routes(adjacency_matrix)
print(routes)

# ---------------------------------------
# Step 2: Defining and Evaluating Routes
# ---------------------------------------

print("-"*50+"\n"+"Running Step 2: Defining and Evaluating Routes ...\n"+"-"*50+"\n")

route = [0, 1, 2, 3]
cost = evaluate_tsp(adjacency_matrix, route)
print(f"Route: {route}")
print(f"Total cost: {cost}")

# -------------------------------
# Step 3: Generate Random Routes
# -------------------------------

print("-"*50+"\n"+"Running Step 3: Generate Random Routes ...\n"+"-"*50+"\n")

num_city = int(input("Enter the number of cities: "))

num_routes = calc_routes(num_city)
print(f"The number of possible 2-way routes for {num_city} cities is: {num_routes}")

adjacency_matrix = random_tsp(num_city)
print(f"Size of adjacency matrix: {len(adjacency_matrix)} x {len(adjacency_matrix[0])}")

print("Adjacency Matrix: ")
for row in adjacency_matrix:
    print(row)

routes = get_routes(adjacency_matrix)
# print("All unique routes between cities:")
# for from_city, to_city, cost in routes:
#     print(f"Route from City {from_city} to City {to_city}: Cost = {cost}")
print(routes)

route = random_route(num_city)
print(f"Random TSP Route: {route}")

cost = evaluate_tsp(adjacency_matrix, route)
print(f"Total cost of the route: {cost}")

# -----------------------------------------------------------------
# Step 4: Try a Bigger Problem Instance
# -----------------------------------------------------------------

print("-"*50+"\n"+"Running Step 4: Try a Bigger Problem Instance ...\n"+"-"*50+"\n")

df = pd.read_csv('ulysses16.csv')

print(f"City Locations (according to ulysses16.csv): \n{df}\n")
print(f"Shape of the DataFrame: {df.shape}")

num_cities = len(df)

adj_matrix = build_adj_matrix_float(num_cities)

for i in range(num_cities):
    for j in range(i + 1, num_cities):
        x_i = df.iloc[i]["x"]
        y_i = df.iloc[i]["y"]

        x_j = df.iloc[j]["x"]
        y_j = df.iloc[j]["y"]

        distance = float(
            np.sqrt((x_i - x_j) ** 2 + (y_i - y_j) ** 2)
        )

        adj_matrix[i][j] = distance
        adj_matrix[j][i] = distance

print("Adjacency Matrix: ")
for row in adj_matrix:
    print([round(distance, 2) for distance in row])

routes = get_routes(adj_matrix)
print(f"\nNumber of unique connections: {len(routes)}")
print("All unique routes between cities:")

routes_df = pd.DataFrame(
    routes,
    columns=["From", "To", "Cost"]
)

routes_df["Cost"] = routes_df["Cost"].round(2)

columns = 4
chunk_size = (len(routes_df) + columns - 1) // columns

chunks = [
    routes_df.iloc[i:i + chunk_size]
    for i in range(0, len(routes_df), chunk_size)
]

tables = [
    chunk.to_string(index=False)
    for chunk in chunks
]

table_lines = [table.split("\n") for table in tables]

for lines in zip(*table_lines):
    print(" | ".join(lines))

route = random_route(num_cities)
print(f"Random Route: {route}")

cost = evaluate_tsp(adj_matrix, route)
print(f"Total cost: {cost:.2f}")