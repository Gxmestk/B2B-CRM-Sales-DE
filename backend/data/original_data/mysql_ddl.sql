CREATE TABLE `accounts` (
      `account` varchar(255) UNIQUE PRIMARY KEY NOT NULL,
      `sector` varchar(255) NOT NULL,
      `year_established` integer64 NOT NULL,
      `revenue` float64 NOT NULL,
      `employees` int64 NOT NULL,
      `office_location` varchar(255) NOT NULL,
      `subsidiary_of` varchar(255) DEFAULT null
);

CREATE TABLE `sale_teams` (
      `sales_agent` varchar(255) UNIQUE PRIMARY KEY NOT NULL,
      `manager` varchar(255) NOT NULL,
      `regional_office` varchar(255) NOT NULL
);

CREATE TABLE `sales_pipeline` (
      `opportunity_id` varchar(255) UNIQUE PRIMARY KEY NOT NULL,
      `sales_agent` varchar(255) NOT NULL,
      `product` varchar(255) NOT NULL,
      `account` varchar(255) DEFAULT null,
      `deal_stage` varchar(255) NOT NULL DEFAULT 'Prospecting',
      `engage_date` DATETIME DEFAULT NULL,
      `close_date` DATETIME DEFAULT NULL,
      `close_value` float64 DEFAULT null
);

CREATE TABLE `products` (
      `product` varchar(255) UNIQUE PRIMARY KEY NOT NULL,
      `series` varchar(255) NOT NULL,
      `sales_price` int64 NOT NULL
);

ALTER TABLE `sales_pipeline` ADD FOREIGN KEY (
      `product`
) REFERENCES `products` (`product`);

ALTER TABLE `sales_pipeline` ADD FOREIGN KEY (
      `sales_agent`
) REFERENCES `sale_teams` (`sales_agent`);

ALTER TABLE `sales_pipeline` ADD FOREIGN KEY (
      `account`
) REFERENCES `accounts` (`account`);
