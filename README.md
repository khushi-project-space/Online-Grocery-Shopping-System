# Online Grocery Shopping System

An ASP.NET Web Forms e-commerce application that lets customers browse groceries (fruits, vegetables, snacks, dairy and more), order from home, and get doorstep delivery without standing in queues. A separate admin panel lets the store manage categories, products, stock, users and orders.

## Features

### Customer side
- Registration, login and forgot-password
- Browse products by category from the menu page
- Shopping cart and order placement
- Order history and bills, with printable invoice
- Profile management
- Feedback and rating submission
- About page

### Admin side
- Dashboard with totals for users, orders, products, categories and feedback
- Category management (add / edit / delete)
- Product management (name, price, quantity, image, category)
- User management
- Order report and order status updates
- Billing information
- View customer feedback

## Tech Stack

| Layer | Technology |
|-------|------------|
| Front end | ASP.NET Web Forms (`.aspx`, master pages), HTML, CSS, JavaScript |
| Back end | C# (code-behind), .NET Framework 4.0+ |
| Database | SQL Server LocalDB (`App_Data/Database.mdf`) via `System.Data.SqlClient` |
| PDF / invoice | iTextSharp (`itextsharp.dll`) |
| IDE | Visual Studio |

## Project Structure

```
Online-Grocery-Shopping-System/
├── admin/                 # Admin panel pages (dashboard, category, product, orders, users, feedback)
│   ├── pro/               # Product images
│   └── dashimg/           # Dashboard icons / GIFs
├── user/                  # Customer pages (login, registration, home, menu, cart, order, invoice, profile)
│   └── userimage/         # User images
├── assets/                # Shared CSS and images
├── temp/                  # Template css / fonts / images / js
├── App_Data/              # Database.mdf and log file (SQL Server LocalDB)
├── Bin/                   # iTextSharp reference
├── gro1_mysql_dump.sql    # Optional MySQL schema + sample data (see note below)
└── web.config             # Connection strings and session config
```

## Database

The app uses a SQL Server LocalDB file, attached automatically through the connection string in `web.config`:

```xml
<add name="con"
     connectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True;MultipleActiveResultSets=True;"
     providerName="System.Data.SqlClient" />
```

Main tables: `User_info`, `Admin_info`, `Category_info`, `Item_info`, `OrderDetails`, `Feedback_info`, `cash_info`.

> **MySQL dump:** `gro1_mysql_dump.sql` is a derived schema with sample seed data. The application code itself is written for SQL Server, so using MySQL requires changing the data-access code and connection string.

## Getting Started

### Prerequisites
- Windows with **Visual Studio** (2012 or newer) with the *ASP.NET and web development* workload
- **SQL Server Express LocalDB** (installed with Visual Studio)
- .NET Framework 4.0 or later

### Run locally
1. Clone the repository:
   ```bash
   git clone https://github.com/khushi-project-space/Online-Grocery-Shopping-System.git
   ```
2. Open the folder in Visual Studio via **File → Open → Web Site**.
3. Confirm `App_Data/Database.mdf` exists and the connection string in `web.config` points to your LocalDB instance.
4. Make sure `itextsharp.dll` is referenced from `Bin/`.
5. Set `user/login.aspx` (or `user/home.aspx`) as the start page and press **F5**.

### Logging in
- **Customers:** register on the registration page, then log in.
- **Admin:** use an account from the `Admin_info` table. The login page checks both `User_info` and `Admin_info`, so admins log in from the same login form.

## Usage Flow

1. A customer registers, logs in and browses products by category.
2. Items are added to the cart and the order is placed.
3. The order appears in the admin **Order Report**, where its status can be updated.
4. The customer can view the bill/invoice and leave feedback.

## Known Limitations / Future Improvements

- Passwords are stored and compared as plain text; they should be hashed (e.g. bcrypt / PBKDF2).
- Several queries are built by string concatenation and are vulnerable to SQL injection; switch to parameterized queries.
- No online payment gateway (orders are placed without integrated payment).
- Possible additions: search and filters, order tracking notifications, email confirmation, responsive mobile layout.

## Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/your-feature`)
3. Commit your changes
4. Push the branch and open a Pull Request

## License

No license has been specified yet. Add a `LICENSE` file (for example MIT) if you want others to reuse the code.
