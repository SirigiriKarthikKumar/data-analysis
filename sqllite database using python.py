import sqlite3

# Connect and create database
conn = sqlite3.connect('sales_data.db')
cursor = conn.cursor()

# Create 'sales' table
cursor.execute('''
CREATE TABLE IF NOT EXISTS sales (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    product TEXT,
    quantity INTEGER,
    price REAL
)
''')

# Insert some sample data
sample_data = [
    ('Laptop', 5, 50000),
    ('Tablet', 8, 15000),
    ('Smartphone', 12, 20000),
    ('Laptop', 3, 52000),
    ('Tablet', 6, 14000),
    ('Smartphone', 10, 21000)
]

cursor.executemany('INSERT INTO sales (product, quantity, price) VALUES (?, ?, ?)', sample_data)
conn.commit()
conn.close()
query = """
SELECT product, 
       SUM(quantity) AS total_qty, 
       SUM(quantity * price) AS revenue 
FROM sales 
GROUP BY product
"""
df = pd.read_sql_query(query, conn)
conn.close()

# Print the results
print("Sales Summary:")
print(df)

# Plot bar chart
df.plot(kind='bar', x='product', y='revenue', legend=False, color='green')
plt.xlabel('Product')
plt.ylabel('Revenue')
plt.title('Revenue by Product')
plt.tight_layout()

# Save chart
plt.savefig("sales_chart.png")
plt.show()