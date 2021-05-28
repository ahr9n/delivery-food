-- DB_project | food_delivery

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

-- --------------------------------------------------------
-- The structure of the `addresses` table

CREATE TABLE `addresses` (
  `id` int(11) NOT NULL,
  `user` int(11) NOT NULL,
  `address` varchar(200) NOT NULL,
  `show` int(1) UNSIGNED DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- The structure of the `categories` table

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `parent` int(11) DEFAULT '0',
  `image` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- The structure of the `orders` table

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `date` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- The structure of the `order_products` table

CREATE TABLE `order_products` (
  `order` int(11) NOT NULL,
  `product` int(11) NOT NULL,
  `price` double DEFAULT '0',
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- The structure of the `photos` table

CREATE TABLE `photos` (
  `id` int(11) NOT NULL,
  `product` int(11) DEFAULT NULL,
  `photo` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- The structure of the `products` table

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `category` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `desc` longtext NOT NULL,
  `price` double DEFAULT '0',
  `new_price` double DEFAULT NULL,
  `main_photo` varchar(200) DEFAULT NULL,
  `show` int(1) NOT NULL DEFAULT '1',
  `del` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- The structure of the `specifications` table

CREATE TABLE `specifications` (
  `product` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `value` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- The structure of the `users` table

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(45) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `middle_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) NOT NULL,
  `role` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------
-- Stored table indexes:

-- Indexes of the `addresses` table
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `address_UNIQUE` (`address`),
  ADD KEY `user_idx` (`user`);

-- Indexes of the `categories` table
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name_UNIQUE` (`name`),
  ADD KEY `parent_idx` (`parent`);

-- Indexes of the `orders` table
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

-- Indexes of the `order_products` table
ALTER TABLE `order_products`
  ADD PRIMARY KEY (`order`,`product`),
  ADD KEY `product_idx` (`product`);

-- Indexes of the `photos` table
ALTER TABLE `photos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sa_idx` (`product`);

-- Indexes of the `products` table
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_idx` (`category`);

-- Indexes of the `specifications` table
ALTER TABLE `specifications`
  ADD PRIMARY KEY (`product`,`name`),
  ADD KEY `product_spec_idx` (`product`);

-- Indexes of the `users` table
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

-- --------------------------------------------------------
-- AUTO_INCREMENT for stored tables

-- AUTO_INCREMENT for the `addresses` table
ALTER TABLE `addresses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

-- AUTO_INCREMENT for the `categories` table
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

-- AUTO_INCREMENT for the `orders` table
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

-- AUTO_INCREMENT for the `photos` table
ALTER TABLE `photos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

-- AUTO_INCREMENT for the `products` table
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

-- AUTO_INCREMENT for the `users` table
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

-- --------------------------------------------------------
-- Foreign key constraints on stored tables

-- Foreign key constraints of the `addresses` table
ALTER TABLE `addresses`
  ADD CONSTRAINT `user_address` FOREIGN KEY (`user`) REFERENCES `users` (`id`);

-- Foreign key constraints of the `categories` table
ALTER TABLE `categories`
  ADD CONSTRAINT `parent` FOREIGN KEY (`parent`) REFERENCES `categories` (`id`);

-- Foreign key constraints of the `order_products` table
ALTER TABLE `order_products`
  ADD CONSTRAINT `order_products_order` FOREIGN KEY (`order`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `product_products_order` FOREIGN KEY (`product`) REFERENCES `products` (`id`);

-- Foreign key constraints of the `photos` table
ALTER TABLE `photos`
  ADD CONSTRAINT `product_photo` FOREIGN KEY (`product`) REFERENCES `products` (`id`);

-- Foreign key constraints of the `products` table
ALTER TABLE `products`
  ADD CONSTRAINT `category_products` FOREIGN KEY (`category`) REFERENCES `categories` (`id`);

-- Foreign key constraints of the `specifications` table
ALTER TABLE `specifications`
  ADD CONSTRAINT `product_spec` FOREIGN KEY (`product`) REFERENCES `products` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
