-- This script only contains the table creation statements and does not fully represent the table in the database. Do not use it as a backup.

-- Table Definition
CREATE TABLE "public"."_prisma_migrations" (
    "id" varchar(36) NOT NULL,
    "checksum" varchar(64) NOT NULL,
    "finished_at" timestamptz,
    "migration_name" varchar(255) NOT NULL,
    "logs" text,
    "rolled_back_at" timestamptz,
    "started_at" timestamptz NOT NULL DEFAULT now(),
    "applied_steps_count" int4 NOT NULL DEFAULT 0,
    PRIMARY KEY ("id")
);

-- This script only contains the table creation statements and does not fully represent the table in the database. Do not use it as a backup.

-- Table Definition
CREATE TABLE "public"."ExpenseByCategory" (
    "expenseByCategoryId" text NOT NULL,
    "expenseSummaryId" text NOT NULL,
    "category" text NOT NULL,
    "amount" int8 NOT NULL,
    "date" timestamp(3) NOT NULL,
    CONSTRAINT "ExpenseByCategory_expenseSummaryId_fkey" FOREIGN KEY ("expenseSummaryId") REFERENCES "public"."ExpenseSummary"("expenseSummaryId") ON DELETE RESTRICT ON UPDATE CASCADE,
    PRIMARY KEY ("expenseByCategoryId")
);

-- This script only contains the table creation statements and does not fully represent the table in the database. Do not use it as a backup.

-- Table Definition
CREATE TABLE "public"."Expenses" (
    "expenseId" text NOT NULL,
    "category" text NOT NULL,
    "amount" float8 NOT NULL,
    "timestamp" timestamp(3) NOT NULL,
    PRIMARY KEY ("expenseId")
);

-- This script only contains the table creation statements and does not fully represent the table in the database. Do not use it as a backup.

-- Table Definition
CREATE TABLE "public"."ExpenseSummary" (
    "expenseSummaryId" text NOT NULL,
    "totalExpenses" float8 NOT NULL,
    "date" timestamp(3) NOT NULL,
    PRIMARY KEY ("expenseSummaryId")
);

-- This script only contains the table creation statements and does not fully represent the table in the database. Do not use it as a backup.

-- Table Definition
CREATE TABLE "public"."Products" (
    "productId" text NOT NULL,
    "name" text NOT NULL,
    "price" float8 NOT NULL,
    "rating" float8,
    "stockQuantity" int4 NOT NULL,
    PRIMARY KEY ("productId")
);

-- This script only contains the table creation statements and does not fully represent the table in the database. Do not use it as a backup.

-- Table Definition
CREATE TABLE "public"."Purchases" (
    "purchaseId" text NOT NULL,
    "productId" text NOT NULL,
    "timestamp" timestamp(3) NOT NULL,
    "quantity" int4 NOT NULL,
    "unitCost" float8 NOT NULL,
    "totalCost" float8 NOT NULL,
    CONSTRAINT "Purchases_productId_fkey" FOREIGN KEY ("productId") REFERENCES "public"."Products"("productId") ON DELETE RESTRICT ON UPDATE CASCADE,
    PRIMARY KEY ("purchaseId")
);

-- This script only contains the table creation statements and does not fully represent the table in the database. Do not use it as a backup.

-- Table Definition
CREATE TABLE "public"."PurchaseSummary" (
    "purchaseSummaryId" text NOT NULL,
    "totalPurchased" float8 NOT NULL,
    "changePercentage" float8,
    "date" timestamp(3) NOT NULL,
    PRIMARY KEY ("purchaseSummaryId")
);

-- This script only contains the table creation statements and does not fully represent the table in the database. Do not use it as a backup.

-- Table Definition
CREATE TABLE "public"."Sales" (
    "saleId" text NOT NULL,
    "productId" text NOT NULL,
    "timestamp" timestamp(3) NOT NULL,
    "quantity" int4 NOT NULL,
    "unitPrice" float8 NOT NULL,
    "totalAmount" float8 NOT NULL,
    CONSTRAINT "Sales_productId_fkey" FOREIGN KEY ("productId") REFERENCES "public"."Products"("productId") ON DELETE RESTRICT ON UPDATE CASCADE,
    PRIMARY KEY ("saleId")
);

-- This script only contains the table creation statements and does not fully represent the table in the database. Do not use it as a backup.

-- Table Definition
CREATE TABLE "public"."SalesSummary" (
    "salesSummaryId" text NOT NULL,
    "totalValue" float8 NOT NULL,
    "changePercentage" float8,
    "date" timestamp(3) NOT NULL,
    PRIMARY KEY ("salesSummaryId")
);

-- This script only contains the table creation statements and does not fully represent the table in the database. Do not use it as a backup.

-- Table Definition
CREATE TABLE "public"."Users" (
    "userId" text NOT NULL,
    "name" text NOT NULL,
    "email" text NOT NULL,
    PRIMARY KEY ("userId")
);

INSERT INTO "public"."_prisma_migrations" ("id", "checksum", "finished_at", "migration_name", "logs", "rolled_back_at", "started_at", "applied_steps_count") VALUES
('42267a11-2e96-4180-9de9-cee22ae5d551', '47c2df9a85b6cfc875dd1cb7139ff446507376b147518338815277f8c6d3b7a3', '2024-10-12 09:50:16.67409+00', '20241012095016_init', NULL, NULL, '2024-10-12 09:50:16.659437+00', 1);


INSERT INTO "public"."ExpenseByCategory" ("expenseByCategoryId", "expenseSummaryId", "category", "amount", "date") VALUES
('0e980d1b-ae93-4a5a-b235-4dfea5f42860', '5229a14b-443b-4551-9d01-4bc0dc820d05', 'Office', 48, '2023-11-23 11:54:21');
INSERT INTO "public"."ExpenseByCategory" ("expenseByCategoryId", "expenseSummaryId", "category", "amount", "date") VALUES
('076a4956-60c2-4b73-b275-530359a91cba', 'c17ff164-1ab4-41e7-91a8-8aab790dcd88', 'Salaries', 66, '2023-08-13 09:49:33');
INSERT INTO "public"."ExpenseByCategory" ("expenseByCategoryId", "expenseSummaryId", "category", "amount", "date") VALUES
('27d49b13-1a3a-4fc7-924c-07147e4d08bd', '45ecf33b-6c3b-4e55-84ec-fa30b88aa03f', 'Salaries', 63, '2023-07-24 09:26:56');
INSERT INTO "public"."ExpenseByCategory" ("expenseByCategoryId", "expenseSummaryId", "category", "amount", "date") VALUES
('037fce5f-2c74-4f7a-a863-8cdd4db8a56b', 'e495b850-cf2b-4b76-93c2-d4241c859cd0', 'Salaries', 77, '2023-05-24 05:24:15'),
('abdb6c33-81ff-45dd-a653-ceae0783729d', '376f8d90-8b66-4cff-bd4e-2fcd14a42845', 'Office', 67, '2023-05-07 12:33:09'),
('246326ac-b8b2-44ee-9f14-f54086aa6a00', '744bb795-0f98-45cd-99ae-45dddb99c3e4', 'Salaries', 12, '2024-01-08 22:08:30'),
('760beed5-a14b-4e4b-9951-3ebe6f5842a1', '4a6a10e5-4f44-4aef-a1bd-c57075f3c44f', 'Office', 57, '2023-06-11 08:03:25'),
('6c653ab9-2b4b-49be-b891-944f5ff98b85', 'd62a1123-18b3-4784-bbdd-70a29f773f99', 'Office', 34, '2023-07-10 00:15:57'),
('0636f954-6ef8-40b4-819f-fbfe4511be56', 'ace2b05e-31de-48bd-a179-e59d16757456', 'Salaries', 43, '2023-12-16 19:29:15'),
('86f616b9-3d68-4a04-b8e8-966a11ce1a78', 'f24f6dd9-dd18-42f9-a76a-95d8198b7636', 'Salaries', 62, '2023-07-04 04:49:15'),
('0381f4e7-08dc-4e10-8d8d-be02a3d1c16b', '2a2a88f0-0148-4667-8bab-7d129586bdf7', 'Professional', 28, '2023-10-18 18:41:07'),
('55628026-8104-4d95-91f8-8062df421036', '560c166c-7093-4583-a007-5af2a88f1dab', 'Office', 65, '2024-01-01 03:49:45'),
('44e1e4bc-462a-4b41-a1d2-a9997fa38ff8', '6faadd8d-5cdd-4b35-a3e8-cb0ada67de3a', 'Salaries', 54, '2023-12-23 19:25:39'),
('ab27a324-088c-4bdc-8ce4-c67a6fbff088', 'be4755fd-0f7c-4292-a0ad-539ad1371f6e', 'Salaries', 97, '2023-03-15 12:50:41'),
('2e335aef-bb2e-401d-bda9-2c123e3031ad', '46a33080-d239-49b2-9f0a-5d2d576a3966', 'Professional', 94, '2023-04-23 21:27:57'),
('5cdabf88-3c50-4519-bcc3-f9eb2abcfdc9', '40dd45c1-b575-48d1-b1a0-2bf474c8b591', 'Salaries', 24, '2023-05-11 09:55:13'),
('bf128fb0-7c2f-45af-916e-4210d0b2c737', '4d452c32-21fd-4891-a5fe-aa481861e0ad', 'Office', 59, '2023-06-16 16:48:42'),
('70157f83-2d78-43b0-85c0-9c955abdbbcd', 'acd41481-9384-4ff1-8004-a3df027a0209', 'Office', 54, '2023-09-30 05:02:44'),
('2f0fc0ff-11d6-4fa2-b930-84c1503fc4b6', '9b523e04-fdae-4b0b-a6d9-58ef64c75431', 'Office', 25, '2023-07-03 22:12:16'),
('ce4b9e25-25fa-49ed-8711-0ec432e913e3', '4ada8077-3799-4690-ae35-c552e4100b1a', 'Professional', 54, '2023-08-23 11:48:59'),
('4bc92339-cf13-4da5-bfc5-d201b4bce01f', 'f6041c02-7b2a-4de3-8aed-81b82528ffe4', 'Professional', 37, '2023-09-14 06:41:32'),
('0cf47f96-e01f-443e-a864-9dd94aa0916b', 'd68b89d4-3332-4e29-8e5a-3c0483af6688', 'Office', 96, '2023-06-11 13:00:11'),
('1629525c-9e25-4252-a55a-708eae10d62c', '9ef8296f-f2b3-4733-8664-7ef5e388734b', 'Office', 85, '2024-01-03 17:10:35'),
('33579bc1-739f-4489-9a5c-1fdea6e1dec2', 'c9a46c10-c426-4cbe-b805-83ab5d963e19', 'Salaries', 55, '2023-08-20 13:33:02'),
('baf43dac-2563-4847-b756-a6c02cc17500', '8f70eaa2-fb78-4b32-bf2f-67c1e4988d2f', 'Salaries', 7, '2023-12-23 06:16:20'),
('c3784dc2-03aa-48c0-aaa7-54ab2d3fb049', 'f222583a-d003-44e1-920d-0f9743a873dc', 'Professional', 90, '2023-09-20 10:01:41'),
('6e0372f9-0dba-4152-91f0-1c14f977b7a0', '0675c624-1e11-4df8-821f-9a2d744dba09', 'Office', 99, '2023-09-02 16:42:29'),
('c011c90e-ccfb-4dd8-b4b3-1daf483d9cba', 'abe1d0e1-65bf-49dc-801d-ba669aae8e33', 'Salaries', 52, '2023-07-05 08:02:52'),
('2956f7b0-0526-4175-a596-7a8c22c4a6e1', '6aef1c35-a1c4-4a58-9be0-b6488a622eaa', 'Professional', 71, '2023-12-01 05:58:17'),
('2fc8c8c4-e1b3-4bc3-86af-ec2d83ed8511', '43b606a2-45c6-4da4-85aa-f219aa6a2960', 'Salaries', 4, '2023-08-29 13:03:56'),
('a4d61feb-528b-4314-8648-eb7c34c2303c', 'db5b8de2-7dc0-4efe-a937-34e537a3f8ec', 'Salaries', 7, '2023-09-24 19:24:50'),
('b2a808b4-bba5-4091-a6b4-ce0f7b917807', 'b0760c67-c326-4f6d-9511-cb2b6896a11f', 'Office', 48, '2023-03-29 09:33:35'),
('fcb238ba-dabc-4d93-9c34-aee8e305f866', '8404fc43-72be-4a3a-bf55-313256b0e083', 'Professional', 15, '2024-01-08 08:48:51'),
('4cfa1c7f-b18a-41d9-9e79-55854f1269bf', 'b149ef3b-f9cc-4560-ab29-4f74ec138c71', 'Professional', 94, '2024-03-08 11:57:57'),
('a9f613be-6d9b-4ff0-8f26-37b71ed47274', '7e793e60-2edc-4adf-9d6f-bb6d09c93481', 'Office', 94, '2024-02-15 10:50:32'),
('198e6bd4-9586-47fd-903d-aac56f99b61d', 'e56345be-2ac9-4ca7-a9a2-1c59846381f7', 'Salaries', 10, '2023-08-13 13:25:33'),
('9a86fea1-8b89-4f2f-829f-4406e530934d', 'cdfd8bfd-1851-4cd1-ab5f-e66e7260ba92', 'Office', 18, '2024-03-11 08:04:25'),
('3ad489e8-ce80-4ace-b5e8-732d226affd2', 'eb8f9ea8-2cdb-4461-80fc-9dd571afb200', 'Salaries', 82, '2023-08-26 01:40:17'),
('c8122a8a-498f-4504-97ed-e6361169099f', '1fe8f10b-24d0-4906-a66c-96ff7783671b', 'Salaries', 95, '2024-02-03 20:08:28'),
('fc7e618a-c26c-42e3-8e38-e87469127c7e', '6cd41a74-4084-4e91-b009-5ab41730d258', 'Office', 91, '2023-10-07 22:01:48'),
('a81be162-da70-43f0-a5d5-279f63bb1183', 'd953877c-72d8-4189-8078-6ed4e46a23a4', 'Salaries', 77, '2024-01-27 17:00:00'),
('dac98685-6d90-41ed-80ba-dded515cc3f0', 'e328c686-7e18-41b3-92e2-e2ddaf3a4a31', 'Professional', 62, '2023-07-03 02:00:59'),
('1241f3cf-99d8-4b84-b734-d60c3b53caad', 'becde53e-60b5-40d1-be9c-27763057f3ac', 'Salaries', 34, '2023-12-20 22:03:05'),
('c8f652dd-e8a6-4eb5-bc17-993d58ea1e10', '803d384f-69a9-450d-8ed3-96d202dbafcd', 'Salaries', 87, '2023-08-05 04:51:45'),
('381c5e38-daae-473d-b32a-b1414106771a', '4749833f-3eaa-452f-bb28-209988f7918d', 'Salaries', 12, '2024-01-15 07:35:22'),
('96e7aac8-5c4e-4a14-9106-a31913e601d0', '852af507-0551-41c8-9d95-a90ed9b1a07c', 'Salaries', 88, '2023-03-15 14:01:06'),
('98ef7cce-68d9-4dee-bca0-804955502b83', '45718dc4-41ef-4a92-b270-3f7eb445fbef', 'Salaries', 100, '2024-01-30 18:16:56'),
('a8fbd7bf-b3f0-4f75-8b5d-6f0a078bef37', '5763fb5e-a9b1-41a7-b873-0ecfad5c749c', 'Office', 98, '2023-12-20 11:34:30'),
('5a34add7-30f1-4878-a0cc-e45556f5bfe9', '87122213-3ad3-418a-8914-5a35e01bb69b', 'Professional', 78, '2023-08-18 16:03:36'),
('1dac299c-9b5a-4fb4-8ab5-fcdf6f9f0298', '10ec2f80-6da0-4909-b8fd-7c5cfdb7bef4', 'Office', 12, '2023-08-06 08:45:27');

INSERT INTO "public"."Expenses" ("expenseId", "category", "amount", "timestamp") VALUES
('5c1121d7-20c8-4890-81c0-949bd60523a3', 'Salaries', 1489153.5, '2022-08-27 18:35:57');
INSERT INTO "public"."Expenses" ("expenseId", "category", "amount", "timestamp") VALUES
('4529aaef-39d0-4188-9256-8c8fd5bad7ca', 'Office', 1579039.97, '2020-05-12 19:39:50');
INSERT INTO "public"."Expenses" ("expenseId", "category", "amount", "timestamp") VALUES
('fca4f2d0-c3d7-4246-a04e-626ab4045c40', 'Office', 607415.3, '2021-06-08 13:48:10');
INSERT INTO "public"."Expenses" ("expenseId", "category", "amount", "timestamp") VALUES
('34de9517-153e-4505-9af8-dc8440e28dd9', 'Salaries', 171044.25, '2022-10-03 22:21:20'),
('c21c08e8-51b9-40f1-be37-b5116cd8d174', 'Salaries', 303743.89, '2020-03-18 00:41:00'),
('fb2dba2d-c186-4165-ab7d-66ce276041a4', 'Salaries', 1707710.31, '2020-05-04 20:18:41'),
('ba5ded78-639c-46ce-80bf-7d50642a1438', 'Office', 1375535.38, '2021-11-04 02:56:56'),
('c2f642b5-399b-48d7-9deb-e6a4eed0b9fa', 'Office', 858502.63, '2020-09-04 19:49:29'),
('fc8b38d8-388a-4898-9ca5-b942bbbec035', 'Professional', 1557261.18, '2020-07-22 02:35:40'),
('36764f05-d204-4f71-bbd3-9d0263ea6863', 'Salaries', 586616.74, '2021-01-18 01:06:07'),
('39e86828-36f4-4282-9599-bc4c42bae3a1', 'Office', 1677605.54, '2022-07-12 16:33:04'),
('66a3d687-05b0-4796-9b09-14941aa73031', 'Salaries', 1280249.59, '2021-09-09 05:45:26'),
('cfbd98f2-c6ed-4bcc-b604-f3d330c5f31e', 'Professional', 1851906.49, '2021-12-24 09:18:27'),
('c68ccd7e-601c-4b09-b76f-c5a19308e526', 'Salaries', 1791685.13, '2022-08-05 03:18:23'),
('3f19431c-3403-468b-9421-c9f54d466052', 'Salaries', 589917.71, '2021-05-19 17:43:00');

INSERT INTO "public"."ExpenseSummary" ("expenseSummaryId", "totalExpenses", "date") VALUES
('5229a14b-443b-4551-9d01-4bc0dc820d05', 40749250.15, '2022-08-23 23:59:13');
INSERT INTO "public"."ExpenseSummary" ("expenseSummaryId", "totalExpenses", "date") VALUES
('c17ff164-1ab4-41e7-91a8-8aab790dcd88', 82516685.25, '2021-12-28 17:03:47');
INSERT INTO "public"."ExpenseSummary" ("expenseSummaryId", "totalExpenses", "date") VALUES
('45ecf33b-6c3b-4e55-84ec-fa30b88aa03f', 41860250.4, '2021-09-18 23:26:30');
INSERT INTO "public"."ExpenseSummary" ("expenseSummaryId", "totalExpenses", "date") VALUES
('e495b850-cf2b-4b76-93c2-d4241c859cd0', 49456718.68, '2022-01-08 04:26:56'),
('376f8d90-8b66-4cff-bd4e-2fcd14a42845', 35573786.54, '2020-08-31 11:45:23'),
('744bb795-0f98-45cd-99ae-45dddb99c3e4', 43767088.74, '2020-04-15 06:57:51'),
('4a6a10e5-4f44-4aef-a1bd-c57075f3c44f', 75311886.34, '2021-11-05 16:10:48'),
('d62a1123-18b3-4784-bbdd-70a29f773f99', 25031430.77, '2020-11-18 23:52:46'),
('ace2b05e-31de-48bd-a179-e59d16757456', 95066201.16, '2020-05-10 17:55:37'),
('f24f6dd9-dd18-42f9-a76a-95d8198b7636', 43519955.41, '2022-02-18 23:26:53'),
('2a2a88f0-0148-4667-8bab-7d129586bdf7', 11975718.82, '2022-01-10 03:25:06'),
('560c166c-7093-4583-a007-5af2a88f1dab', 51372909.22, '2022-04-24 18:53:13'),
('6faadd8d-5cdd-4b35-a3e8-cb0ada67de3a', 74722976.97, '2022-01-14 09:36:38'),
('be4755fd-0f7c-4292-a0ad-539ad1371f6e', 75641467.74, '2021-12-21 15:01:09'),
('46a33080-d239-49b2-9f0a-5d2d576a3966', 25500681.97, '2022-04-01 15:50:39'),
('40dd45c1-b575-48d1-b1a0-2bf474c8b591', 539510.64, '2020-01-13 13:28:34'),
('4d452c32-21fd-4891-a5fe-aa481861e0ad', 39145989.15, '2022-04-13 22:53:06'),
('acd41481-9384-4ff1-8004-a3df027a0209', 21149322.36, '2022-03-11 04:03:13'),
('9b523e04-fdae-4b0b-a6d9-58ef64c75431', 11169032.82, '2021-08-06 01:20:04'),
('4ada8077-3799-4690-ae35-c552e4100b1a', 82993070.31, '2021-08-03 10:58:02'),
('f6041c02-7b2a-4de3-8aed-81b82528ffe4', 66908936.55, '2020-08-05 18:45:02'),
('d68b89d4-3332-4e29-8e5a-3c0483af6688', 33514872.87, '2021-07-01 15:13:37'),
('9ef8296f-f2b3-4733-8664-7ef5e388734b', 63157720.91, '2020-04-20 11:27:14'),
('c9a46c10-c426-4cbe-b805-83ab5d963e19', 58355575.44, '2022-02-17 22:27:44'),
('8f70eaa2-fb78-4b32-bf2f-67c1e4988d2f', 84500652.59, '2021-01-14 21:41:26'),
('f222583a-d003-44e1-920d-0f9743a873dc', 83208591.41, '2021-05-23 02:25:54'),
('0675c624-1e11-4df8-821f-9a2d744dba09', 33465485.39, '2022-10-29 12:01:44'),
('abe1d0e1-65bf-49dc-801d-ba669aae8e33', 27097402.85, '2021-01-02 11:54:11'),
('6aef1c35-a1c4-4a58-9be0-b6488a622eaa', 60148771.5, '2021-11-24 13:21:00'),
('43b606a2-45c6-4da4-85aa-f219aa6a2960', 39634053.67, '2021-01-30 15:52:39'),
('db5b8de2-7dc0-4efe-a937-34e537a3f8ec', 63931774.54, '2021-10-05 02:05:46'),
('b0760c67-c326-4f6d-9511-cb2b6896a11f', 61688809.89, '2022-07-02 22:34:16'),
('8404fc43-72be-4a3a-bf55-313256b0e083', 70074829.75, '2022-09-20 00:25:06'),
('b149ef3b-f9cc-4560-ab29-4f74ec138c71', 80265893.3, '2022-12-21 05:58:49'),
('7e793e60-2edc-4adf-9d6f-bb6d09c93481', 10938282.95, '2021-11-01 20:28:10'),
('e56345be-2ac9-4ca7-a9a2-1c59846381f7', 33591951.95, '2021-11-23 16:52:43'),
('cdfd8bfd-1851-4cd1-ab5f-e66e7260ba92', 845358.59, '2022-11-22 12:43:41'),
('eb8f9ea8-2cdb-4461-80fc-9dd571afb200', 66690967.68, '2022-02-13 23:10:27'),
('1fe8f10b-24d0-4906-a66c-96ff7783671b', 43874777.57, '2022-08-14 20:45:25'),
('6cd41a74-4084-4e91-b009-5ab41730d258', 40265520.46, '2022-07-16 21:42:02'),
('d953877c-72d8-4189-8078-6ed4e46a23a4', 50581576.01, '2020-07-23 13:00:44'),
('e328c686-7e18-41b3-92e2-e2ddaf3a4a31', 68186405.58, '2021-03-10 22:55:10'),
('becde53e-60b5-40d1-be9c-27763057f3ac', 71676578.77, '2022-10-17 04:27:37'),
('803d384f-69a9-450d-8ed3-96d202dbafcd', 44651450.2, '2020-08-08 19:52:19'),
('4749833f-3eaa-452f-bb28-209988f7918d', 98571536.55, '2022-06-18 07:04:03'),
('852af507-0551-41c8-9d95-a90ed9b1a07c', 31396413.25, '2021-09-18 17:44:00'),
('45718dc4-41ef-4a92-b270-3f7eb445fbef', 30345484.18, '2021-01-18 21:57:02'),
('5763fb5e-a9b1-41a7-b873-0ecfad5c749c', 78841883.13, '2021-01-10 19:15:27'),
('87122213-3ad3-418a-8914-5a35e01bb69b', 1718619.1, '2021-09-26 12:13:08'),
('10ec2f80-6da0-4909-b8fd-7c5cfdb7bef4', 97167385.15, '2020-03-04 02:21:16');

INSERT INTO "public"."Products" ("productId", "name", "price", "rating", "stockQuantity") VALUES
('d35623ee-bef6-42b2-8776-2f99f8bb4782', 'Pinkscale Blazing Star', 456.04, 2.25, 124834);
INSERT INTO "public"."Products" ("productId", "name", "price", "rating", "stockQuantity") VALUES
('8ac1ac77-7358-425e-be16-0bdde9f02e59', 'Gila Milkvetch', 899.05, 3.56, 799402);
INSERT INTO "public"."Products" ("productId", "name", "price", "rating", "stockQuantity") VALUES
('1afc136b-4d9f-4e8e-aace-8e1df908a404', 'Rocky Mountain Zinnia', 264.37, 3.23, 842192);
INSERT INTO "public"."Products" ("productId", "name", "price", "rating", "stockQuantity") VALUES
('af84cc12-4fea-4f58-aece-f2ce92ca9580', 'Guadalupe Suncup', 555.93, 4.09, 236333),
('86e3bb1c-2f5d-4774-98f3-4df7cddd0a0f', 'Saline Phlox', 82.62, 4.8, 601208),
('26b017c6-06d8-443f-9b4a-d6b1cee6f4c0', 'Common Brighteyes', 435.44, 0.27, 124068),
('440c9e80-6bf8-4eb3-b2d2-f81936d67de3', 'Vermejo Phlox', 759.15, 2.46, 234525),
('98255f4e-40a6-470f-89a5-0792729f8947', 'Purple Marshlocks', 974.99, 4.82, 739009),
('2a339fb2-f9f3-43bc-a85a-b217a0a38f12', 'Hamatocaulis Moss', 639.9, 1.17, 754285),
('8a8391b2-b4ac-4847-b652-66ffd8d65875', 'Wax Myrtle', 62.95, 4.6, 205240),
('be2157fb-7454-405e-9511-bf7ba81b7726', 'Thladiantha', 699, 1.65, 399124),
('fdf1ba3d-fa06-4ce5-90ff-d081c5d37176', 'Common Tarweed', 899.61, 2.39, 196884),
('afded6df-058f-477d-9878-e0e0b1d3dff3', 'Smooth Phlox', 575.6, 4.38, 673658),
('daa29167-82a7-474b-9687-b8b903e7ec69', 'Lemmon''s Beggarticks', 492.35, 1.07, 205143),
('ccb83982-71f3-4497-bad8-7e64c6920dc6', 'Globe Fimbry', 304.69, 2.62, 388596),
('1936d406-e89e-40e4-bff7-1827532269d4', 'Columbia Milkvetch', 845.15, 2.21, 631658),
('c849a535-5f8b-47e3-889c-015693a644ac', 'Girdlepod', 880.09, 1.49, 65457),
('0c3e80ee-59b3-4fc4-b760-8b07acc2d3ae', 'Lindley''s Clerodendrum', 51.66, 1.53, 263383),
('d8f5bee3-f3eb-4071-a124-6b857e0fd798', 'Arizonia Dry Rock Moss', 746.88, 4.71, 616812),
('8d15de86-0e4a-4414-9166-7a33610202d3', 'Clamshell Orchid', 17.1, 0.79, 604774),
('ea8fd0b9-c2d9-4d43-9c23-44cb99d079bb', 'Fourleaf Mare''s-tail', 905.04, 3.71, 909107),
('25d01c80-bca1-4a00-b1d0-0fbd39ff9e89', 'Simpson''s Rosinweed', 184.41, 1.98, 953695),
('1d6df6e3-b7ea-4507-9d66-87c6ee8ed5b9', 'Lobelia', 163.6, 0.81, 341530),
('000a8c23-5bca-436c-a216-4e747a94c511', 'Yew Plum Pine', 196.27, 1.6, 967173),
('c5b600dc-6bfb-492a-b335-c3cc8c707959', 'Thimbleberry', 602.37, 0.13, 162208),
('9d5fafbc-312b-47e8-ada1-283918f0c3b5', 'Yellowturbans', 564.82, 4.74, 33021),
('0114d5d4-ae48-46fa-b0ca-afe60eb88add', 'Field Brome', 664.2, 0.13, 363992),
('e5b0da8c-148d-4680-b262-8609fb8a10da', 'Pentas', 685.1, 1.5, 635092),
('2be5b024-2c96-4f29-912c-c6f36353f799', 'Strigose Beard Lichen', 373.81, 1.06, 35383),
('fcf2e432-62a3-4b6f-a34d-36e42a12272e', 'Mad River Fleabane', 669.97, 1.34, 880242),
('fc4c81e5-f1ac-40f5-8c6f-da3fbad5599d', 'Chickenthief', 100.11, 0.49, 896782),
('07238d8e-0037-4972-87ca-0df206ee3e42', 'Palmleaf Poppymallow', 22.99, 3.42, 635344),
('154b7860-23a2-4564-ad99-1745ab7122ef', 'Guayanan Waterclover', 45.45, 0.34, 456487),
('8d4bf814-65d4-4df4-84cc-68911d925fdf', 'Emory''s Acacia', 847.6, 1.79, 638956),
('a52bf1bd-3d35-4cd2-849a-354e3952e2d2', 'American Century Plant', 969.47, 3.66, 248630),
('73e49543-1a6e-4821-94b0-7c392b4db53a', 'test', 123, 4, 1000),
('da57defb-346a-4968-963a-2ecaa1b72243', '123', 123, 3, 2000);

INSERT INTO "public"."Purchases" ("purchaseId", "productId", "timestamp", "quantity", "unitCost", "totalCost") VALUES
('5035f91e-4a29-411a-8779-17f6105675f1', 'd35623ee-bef6-42b2-8776-2f99f8bb4782', '2007-09-28 13:56:51', 875, 4163.31, 7871.43);
INSERT INTO "public"."Purchases" ("purchaseId", "productId", "timestamp", "quantity", "unitCost", "totalCost") VALUES
('85841cb5-2132-40f2-b923-9769ee3c199b', '8ac1ac77-7358-425e-be16-0bdde9f02e59', '2015-02-01 13:04:43', 471, 5673.17, 485.48);
INSERT INTO "public"."Purchases" ("purchaseId", "productId", "timestamp", "quantity", "unitCost", "totalCost") VALUES
('de384851-f898-4495-99b8-73448bb470bf', '1afc136b-4d9f-4e8e-aace-8e1df908a404', '2010-10-22 19:38:20', 37, 3835.06, 4202.25);
INSERT INTO "public"."Purchases" ("purchaseId", "productId", "timestamp", "quantity", "unitCost", "totalCost") VALUES
('e0b0486c-6396-42b7-9a84-e21bd3a88600', 'af84cc12-4fea-4f58-aece-f2ce92ca9580', '2020-01-25 13:30:58', 201, 1822.27, 8028.29),
('822e6025-e582-4e8c-b143-dc5ebad4c18c', '86e3bb1c-2f5d-4774-98f3-4df7cddd0a0f', '2011-12-30 12:54:41', 789, 9238.02, 5086.57),
('dd6d3a14-92d5-40f4-9bf4-92fb4043882c', '26b017c6-06d8-443f-9b4a-d6b1cee6f4c0', '2014-02-26 01:13:31', 251, 2443.32, 9520.42),
('434e5415-cb23-4170-b1e7-bc85737dc8c7', '440c9e80-6bf8-4eb3-b2d2-f81936d67de3', '2001-11-18 23:49:33', 418, 5085.79, 5394.89),
('963a92ab-e092-4f3d-8b6a-5ab803550d78', '98255f4e-40a6-470f-89a5-0792729f8947', '2020-04-27 08:53:44', 926, 8626.52, 3526.35),
('b4aebfdc-bce9-4e90-89fc-5098447d687a', '2a339fb2-f9f3-43bc-a85a-b217a0a38f12', '2020-02-05 13:02:55', 754, 9052.79, 8035.97),
('de2ba6a2-c291-4a60-aad1-23d5749c5847', '8a8391b2-b4ac-4847-b652-66ffd8d65875', '2020-05-07 16:41:13', 365, 1105.02, 361.77),
('78ea5f20-8fcc-4b6c-836f-e4b7a58d7479', 'be2157fb-7454-405e-9511-bf7ba81b7726', '2014-08-12 16:37:41', 975, 4783.47, 9517.85),
('61ba57e9-81fe-4d04-85b5-6aab219ced9d', 'fdf1ba3d-fa06-4ce5-90ff-d081c5d37176', '2008-12-07 16:18:59', 286, 6910.82, 9006.07),
('012d028b-4d6b-43bf-8d69-edf296133c9e', 'afded6df-058f-477d-9878-e0e0b1d3dff3', '2005-12-29 10:50:55', 71, 4058.81, 5983.42),
('8155b76c-3da2-4fb4-ba18-68bf8a2cec1b', 'daa29167-82a7-474b-9687-b8b903e7ec69', '2007-08-15 18:41:49', 963, 2198.44, 4935.68),
('4d449c76-ee8a-473e-8135-f74875a31964', 'ccb83982-71f3-4497-bad8-7e64c6920dc6', '2014-12-05 06:28:48', 614, 6565.99, 6406.98),
('115c6e6c-e6d0-418f-990e-1730f9e4b02e', '1936d406-e89e-40e4-bff7-1827532269d4', '2003-12-17 12:52:02', 193, 2562.72, 788.08),
('7b898dfe-79e0-472c-a19e-d75d6a2719fd', 'c849a535-5f8b-47e3-889c-015693a644ac', '2014-05-13 17:09:07', 585, 1580.69, 2633.43),
('cb3000e8-df2e-4e8b-99ed-4ceb35077404', '0c3e80ee-59b3-4fc4-b760-8b07acc2d3ae', '2006-10-21 15:28:13', 938, 6197.05, 3487.61),
('8b709837-e51b-493a-8720-89e64f9888e2', 'd8f5bee3-f3eb-4071-a124-6b857e0fd798', '2002-08-23 21:20:02', 388, 3280.29, 21.24),
('8ee49368-1e96-41ed-bc53-7ba90ed537a4', '8d15de86-0e4a-4414-9166-7a33610202d3', '2022-09-09 02:34:59', 463, 4646.46, 273.21),
('a6d93761-366f-4e66-9a2f-2621d94896cb', 'ea8fd0b9-c2d9-4d43-9c23-44cb99d079bb', '2013-04-06 06:29:40', 893, 2857.95, 7423.21),
('c6207ac3-3c64-49f4-9383-e47c32f11c28', '25d01c80-bca1-4a00-b1d0-0fbd39ff9e89', '2002-06-17 12:03:13', 22, 3180.14, 9077.46),
('02cb1517-154a-469e-88a1-33449be5b6de', '1d6df6e3-b7ea-4507-9d66-87c6ee8ed5b9', '2017-05-26 03:42:34', 70, 4308.81, 1589.27),
('6e468dfb-8cfc-4ad6-af0c-af0a1f6726ab', '000a8c23-5bca-436c-a216-4e747a94c511', '2013-02-03 13:03:56', 208, 3424.81, 9545.07),
('0f67af62-d82b-4986-ba91-0d7cc8261e21', 'c5b600dc-6bfb-492a-b335-c3cc8c707959', '2020-03-16 04:44:49', 309, 9757.04, 9843.24),
('c7539c9a-06a1-4e1c-aba1-4b7c60354974', '9d5fafbc-312b-47e8-ada1-283918f0c3b5', '2011-08-01 04:44:36', 97, 4437.3, 7227.92),
('80e5fcca-73a3-4679-b27f-21328a77e077', '0114d5d4-ae48-46fa-b0ca-afe60eb88add', '2021-10-23 09:58:14', 727, 6706.78, 3444.68),
('33d99aae-0b34-4c3c-af34-dba1201fa025', 'e5b0da8c-148d-4680-b262-8609fb8a10da', '2013-12-25 00:37:26', 246, 7074.43, 1551.41),
('0a05c7b9-01a2-48d2-b1ed-51e11dc50550', '2be5b024-2c96-4f29-912c-c6f36353f799', '2001-10-29 19:34:59', 193, 1576.29, 5458.34),
('4bbd5b44-51ea-40cb-b993-8c1c1f3d6146', 'fcf2e432-62a3-4b6f-a34d-36e42a12272e', '2008-05-09 00:34:59', 265, 9629.95, 9902.55),
('1dc72d06-61c1-4606-b604-15fcd1a3943e', 'fc4c81e5-f1ac-40f5-8c6f-da3fbad5599d', '2018-12-12 10:12:24', 342, 9107.59, 9187.51),
('51f66b06-f965-433c-9fca-35e344324b3f', '07238d8e-0037-4972-87ca-0df206ee3e42', '2022-11-23 16:45:20', 623, 3511.85, 8448.84),
('0669c359-14ad-488f-bf66-553cb4263a06', '154b7860-23a2-4564-ad99-1745ab7122ef', '2016-06-18 10:26:07', 856, 584.88, 6455.21),
('5e697ec5-7722-48b5-b682-c3752a11b62e', '8d4bf814-65d4-4df4-84cc-68911d925fdf', '2003-08-07 17:41:10', 330, 9835.78, 311.95),
('3e54b486-1044-46b6-82f9-2646d92d4afa', 'a52bf1bd-3d35-4cd2-849a-354e3952e2d2', '2007-02-01 19:40:46', 265, 6506.44, 6583.9),
('3726ca7b-1f32-4cad-a21b-6112de7d73ad', 'd35623ee-bef6-42b2-8776-2f99f8bb4782', '2012-07-16 01:03:33', 395, 4122.4, 4838.66),
('54e4ebc5-b083-42f3-a3ec-90dcd64923f3', '8ac1ac77-7358-425e-be16-0bdde9f02e59', '2002-02-19 15:33:07', 230, 2500.44, 7003.48),
('21af41db-67ee-42fb-ad12-8e53c9017a21', '1afc136b-4d9f-4e8e-aace-8e1df908a404', '2005-04-20 20:56:35', 770, 3563.47, 2068.71),
('6efcb79a-8db6-4271-b28b-cfb46441d6d8', 'af84cc12-4fea-4f58-aece-f2ce92ca9580', '2013-01-08 17:38:44', 903, 6854.34, 6894.18),
('a5d27d65-6419-4741-94f0-9499151f9031', '86e3bb1c-2f5d-4774-98f3-4df7cddd0a0f', '2018-11-16 06:44:31', 220, 170.61, 3140.28),
('0ffb160a-c687-4155-bea3-fc3ecc7da237', '26b017c6-06d8-443f-9b4a-d6b1cee6f4c0', '2022-02-13 05:52:33', 625, 5823.23, 4498.82),
('f96e84fc-3b9c-4f96-b80c-0646752c2624', '440c9e80-6bf8-4eb3-b2d2-f81936d67de3', '2008-05-05 23:57:50', 260, 1320.91, 6951.15),
('65419b2f-d156-408b-bfb6-52846e3aca1d', '98255f4e-40a6-470f-89a5-0792729f8947', '2010-06-27 23:54:15', 72, 6999.3, 4171.88),
('cd59eb23-5b53-4a0c-a1a0-0950c5ea17f4', '2a339fb2-f9f3-43bc-a85a-b217a0a38f12', '2018-06-04 02:16:54', 846, 1424.7, 604.87),
('31b464d9-89a7-431e-9bf1-9d68ee05d549', '8a8391b2-b4ac-4847-b652-66ffd8d65875', '2019-12-08 22:05:22', 998, 9289.05, 3108.03),
('767fc135-43ca-4067-87bb-0ab503bbd4c3', 'be2157fb-7454-405e-9511-bf7ba81b7726', '2005-01-25 15:21:10', 311, 1386.68, 8924.26),
('52ce8633-b4cc-455d-94ab-531a7fb5b720', 'fdf1ba3d-fa06-4ce5-90ff-d081c5d37176', '2022-09-27 13:23:04', 71, 6751.76, 2580.36),
('e292f886-0f8d-4989-bc01-f43dfffde54e', 'afded6df-058f-477d-9878-e0e0b1d3dff3', '2008-10-13 00:50:04', 134, 4446.17, 1718.57),
('42e2086e-6dda-4c8e-b635-4387d794d6a0', 'daa29167-82a7-474b-9687-b8b903e7ec69', '2014-09-16 22:59:06', 807, 9916.73, 6818.54),
('c223c7fe-38d5-4291-b618-c44bd9f797a7', 'ccb83982-71f3-4497-bad8-7e64c6920dc6', '2007-03-28 02:21:31', 726, 2967.87, 5509.38),
('e12f6fd6-af77-4556-8866-c724d88acc5d', '1936d406-e89e-40e4-bff7-1827532269d4', '2010-09-20 14:09:37', 763, 2083.13, 9062.53),
('503fbb6e-2c84-4293-ad1e-8ad1a4ea3c8f', 'c849a535-5f8b-47e3-889c-015693a644ac', '2016-08-03 19:45:31', 675, 6611.91, 2353.38),
('418785b8-d434-4f1b-827b-52584eb91414', '0c3e80ee-59b3-4fc4-b760-8b07acc2d3ae', '2005-03-28 16:39:46', 839, 1488.73, 403.2),
('032f3bc6-1edf-45ee-8cdd-7a3dbd4ec6bd', 'd8f5bee3-f3eb-4071-a124-6b857e0fd798', '2010-09-11 18:58:14', 776, 9893.08, 2071.46),
('f64f8bfd-7c71-4bb0-a74e-21907a8b2a71', '8d15de86-0e4a-4414-9166-7a33610202d3', '2011-06-19 11:19:53', 720, 3132.2, 1104.45),
('aa148601-a438-4c9a-ba20-6645945e750b', 'ea8fd0b9-c2d9-4d43-9c23-44cb99d079bb', '2001-12-13 15:26:09', 392, 4880.07, 7915.32),
('feabf3d1-9727-4b03-bd5c-2c97d85fc91e', '25d01c80-bca1-4a00-b1d0-0fbd39ff9e89', '2019-07-06 09:30:09', 265, 2609.83, 1980.18),
('6f44cf51-39cf-46c6-8e7e-719347ec2124', '1d6df6e3-b7ea-4507-9d66-87c6ee8ed5b9', '2005-08-17 21:00:54', 984, 8085.15, 8511.07),
('e76ebddb-90a1-4916-a3bd-17b5c58855dd', '000a8c23-5bca-436c-a216-4e747a94c511', '2003-10-14 08:56:13', 575, 6609.95, 3212.6),
('00fb05b1-724d-4b82-8600-441d20127ecb', 'c5b600dc-6bfb-492a-b335-c3cc8c707959', '2009-01-26 02:37:46', 324, 5032.83, 6453.79),
('2b5d452d-be4f-4fc0-a018-a156b0aa144a', '9d5fafbc-312b-47e8-ada1-283918f0c3b5', '2017-09-20 01:05:24', 859, 9826.12, 4717.49),
('8272d8dc-df85-455c-b2ec-7cc4611a570c', '0114d5d4-ae48-46fa-b0ca-afe60eb88add', '2014-11-05 03:06:06', 713, 8238.67, 6012.29),
('5d8b58d2-63b1-4419-ab46-16ed3664adfc', 'e5b0da8c-148d-4680-b262-8609fb8a10da', '2008-11-29 17:59:44', 230, 684.84, 202.1),
('e33fabca-19cf-469b-b3e7-6e5f1f434a3e', '2be5b024-2c96-4f29-912c-c6f36353f799', '2018-03-14 04:27:34', 247, 7781.32, 55.1),
('17c90a13-0871-44a5-9dcf-9b46d756b780', 'fcf2e432-62a3-4b6f-a34d-36e42a12272e', '2010-05-03 03:18:22', 267, 5.18, 5559.82),
('22be5e72-440c-4a02-8176-9eb50d9cdc99', 'fc4c81e5-f1ac-40f5-8c6f-da3fbad5599d', '2001-09-14 20:35:26', 298, 388.02, 364.51),
('3b663fc6-e550-4513-9df4-ecd7399e3ad4', '07238d8e-0037-4972-87ca-0df206ee3e42', '2021-07-11 20:29:31', 356, 3099.1, 9858.3),
('a7cd1009-cca3-4dd0-a08e-519fbef15886', '154b7860-23a2-4564-ad99-1745ab7122ef', '2015-11-29 04:47:23', 560, 8579.08, 6600.09),
('08232378-99cf-4828-b36f-6d7a31baba64', '8d4bf814-65d4-4df4-84cc-68911d925fdf', '2016-09-15 07:58:08', 843, 556, 6556.65),
('d33fe221-fd05-4f75-a8cd-8540ab8e8ce6', 'a52bf1bd-3d35-4cd2-849a-354e3952e2d2', '2016-03-27 16:52:42', 288, 9563.81, 1649.02),
('9cd56445-6055-450a-a992-e3ae14bb3338', 'd35623ee-bef6-42b2-8776-2f99f8bb4782', '2000-03-20 02:42:32', 725, 9495.08, 5749.92),
('fd6d7c0a-5d02-4dbc-8217-1d826eb569ce', '8ac1ac77-7358-425e-be16-0bdde9f02e59', '2012-09-14 23:33:07', 141, 4504.95, 1561.89),
('fe28b71d-8883-4157-ac89-4a5105e8ff54', '1afc136b-4d9f-4e8e-aace-8e1df908a404', '2008-01-02 02:33:03', 388, 6425.96, 837.03),
('93a95d90-2d95-4e21-9d61-deb872b8ce23', 'af84cc12-4fea-4f58-aece-f2ce92ca9580', '2018-06-18 17:24:06', 194, 8925.08, 8644.66),
('52a78535-b622-4c9e-834c-21ca705d07b5', '86e3bb1c-2f5d-4774-98f3-4df7cddd0a0f', '2022-11-06 03:27:35', 873, 7537.82, 1841.36),
('ed4adaea-bcd2-49e5-bc9e-84ed807fa04c', '26b017c6-06d8-443f-9b4a-d6b1cee6f4c0', '2022-04-20 14:20:15', 70, 5186.13, 9731.04),
('1ee44e30-7a8f-4e88-b6dd-01c11b26f6b9', '440c9e80-6bf8-4eb3-b2d2-f81936d67de3', '2008-04-18 13:02:07', 10, 6835.47, 4138.19),
('913bc6d9-6757-457c-a565-471396e4f5b5', '98255f4e-40a6-470f-89a5-0792729f8947', '2010-06-26 01:51:22', 651, 1095.15, 503.43),
('d33baec5-186c-428d-996d-6dbd12e20c10', '2a339fb2-f9f3-43bc-a85a-b217a0a38f12', '2015-06-01 00:52:08', 638, 2282.03, 5722),
('6eb61d25-4cf6-43f8-a52d-302cf0b29553', '8a8391b2-b4ac-4847-b652-66ffd8d65875', '2011-04-19 21:39:04', 67, 5414.05, 1905.77),
('37b1920b-5a4b-41c7-bbf0-a872e93f2ab3', 'be2157fb-7454-405e-9511-bf7ba81b7726', '2008-12-12 12:16:22', 775, 333.25, 2883.66),
('9b4f68c8-2d1a-44c8-95e9-3b257a6c37e3', 'fdf1ba3d-fa06-4ce5-90ff-d081c5d37176', '2020-12-29 16:46:08', 513, 6781.28, 5454.83),
('87c3172d-9ae8-4163-b8ef-ad638fa27c95', 'afded6df-058f-477d-9878-e0e0b1d3dff3', '2019-04-05 05:20:27', 13, 5414.02, 4540.62),
('8aed5186-cb4a-4bbb-b8be-857ff8227289', 'daa29167-82a7-474b-9687-b8b903e7ec69', '2019-05-19 23:47:06', 522, 2047.88, 456.65),
('a5e1bed8-ced3-41cd-af3b-d891e01e1c1d', 'ccb83982-71f3-4497-bad8-7e64c6920dc6', '2018-12-19 05:41:28', 20, 7741.5, 6205.14),
('dcc30321-e243-4cce-808a-2e0c553eee94', '1936d406-e89e-40e4-bff7-1827532269d4', '2002-10-06 13:58:33', 473, 8571.71, 3088.43),
('d3462347-2e06-46ff-9088-ceb25ee3ed11', 'c849a535-5f8b-47e3-889c-015693a644ac', '2008-10-07 18:13:43', 621, 2592.95, 5944.58),
('24bb1ac4-4d5c-4308-a6f9-a004bd819f5e', '0c3e80ee-59b3-4fc4-b760-8b07acc2d3ae', '2003-08-29 16:23:44', 240, 7732.65, 4956.83),
('42d5ade2-6b62-47f0-aaa4-0b065a0b73ff', 'd8f5bee3-f3eb-4071-a124-6b857e0fd798', '2020-08-16 06:05:41', 729, 9648.57, 9558.36),
('394dd7bb-d9ca-4ded-87ca-6336ca68f06c', '8d15de86-0e4a-4414-9166-7a33610202d3', '2019-06-19 07:23:51', 109, 6608.23, 8900.4),
('312e3902-2aaa-4678-bafb-534ec5fc1c24', 'ea8fd0b9-c2d9-4d43-9c23-44cb99d079bb', '2014-03-12 17:47:55', 490, 4139.51, 428.37),
('9685898d-0b3c-4500-98cf-101e4e5818cf', '25d01c80-bca1-4a00-b1d0-0fbd39ff9e89', '2002-12-27 20:19:43', 926, 305.23, 326.1),
('c67d1950-3c03-401e-9f4a-573cc919c3ff', '1d6df6e3-b7ea-4507-9d66-87c6ee8ed5b9', '2000-03-28 15:44:26', 210, 838.57, 3004.31),
('0d793046-8eff-412c-983e-c13196c331cf', '000a8c23-5bca-436c-a216-4e747a94c511', '2009-09-30 02:48:52', 452, 6538.73, 9188.61),
('b38af82a-d3fb-46ec-9f98-346faf95629f', 'c5b600dc-6bfb-492a-b335-c3cc8c707959', '2018-01-17 10:45:44', 418, 7846.58, 9258.71),
('32e25004-21cf-44ab-b44e-e3580d0ef9ce', '9d5fafbc-312b-47e8-ada1-283918f0c3b5', '2004-07-18 14:25:34', 902, 1056.47, 4319.07),
('0bfea984-8cdd-45ee-9407-5c9da64f94b0', '0114d5d4-ae48-46fa-b0ca-afe60eb88add', '2017-01-24 20:41:03', 757, 5163.91, 8653.39),
('570950ee-9c94-4423-bc5d-546524adf1f3', 'e5b0da8c-148d-4680-b262-8609fb8a10da', '2013-02-09 06:05:04', 856, 9928.49, 3502.45),
('5ad8b5f9-aaee-428e-aa11-3c1991e6d703', '2be5b024-2c96-4f29-912c-c6f36353f799', '2000-01-23 11:04:04', 879, 4230.1, 7286.78),
('6253b4e0-5089-4daa-ad09-6424516ff613', 'fcf2e432-62a3-4b6f-a34d-36e42a12272e', '2004-07-08 16:20:29', 762, 1296.53, 7583.95);

INSERT INTO "public"."PurchaseSummary" ("purchaseSummaryId", "totalPurchased", "changePercentage", "date") VALUES
('c452c304-0f7e-474f-b750-43c542df3412', 7599849.58, -50.31, '2023-05-27 05:20:14');
INSERT INTO "public"."PurchaseSummary" ("purchaseSummaryId", "totalPurchased", "changePercentage", "date") VALUES
('1206e83e-0e1b-42e5-8ec5-35cd1080f09d', 5701783, -89.63, '2023-12-05 05:52:50');
INSERT INTO "public"."PurchaseSummary" ("purchaseSummaryId", "totalPurchased", "changePercentage", "date") VALUES
('21491665-4761-4dea-b5f1-16b04d9f57bb', 2875081.56, 97.28, '2023-03-20 06:11:24');
INSERT INTO "public"."PurchaseSummary" ("purchaseSummaryId", "totalPurchased", "changePercentage", "date") VALUES
('a8ae9a24-a851-4a75-be59-a16834827bb8', 5887134.05, 84.43, '2023-12-16 17:22:23'),
('2de46932-fab9-41f6-87ca-8c06083a66f2', 6700381.67, -15.4, '2023-03-26 07:09:45'),
('63409896-65aa-4f06-9bb6-fd0b6336eeb5', 3703183.4, 93.36, '2023-09-12 18:48:33'),
('ab29178e-21a0-407f-8cef-8f99f5bd140c', 8183876.36, 10.75, '2023-07-13 19:13:53'),
('1475b96b-0d32-4679-b8dc-050e446f8cf8', 6771390.73, 8.17, '2023-04-17 20:13:19'),
('cd22c91d-af7a-4334-843c-0d9b3bd90bf8', 5362805.15, -69.92, '2023-12-30 11:00:31'),
('b9952c34-ef74-41f8-9c44-76e0516dc7b9', 7901696.36, -8.22, '2024-01-02 01:46:59'),
('677b220c-96b8-46b8-b367-be71b8a2fbb2', 592809.08, -19.9, '2023-07-07 19:23:16'),
('584fec60-a573-4445-b23e-fd9d46eebcab', 787656.13, -85.81, '2023-07-10 16:48:15'),
('124d1a24-3fd2-415d-9a6d-11737c319082', 1358410.16, 81.52, '2024-01-01 16:20:10'),
('fd8bfb7f-a97c-4dd3-a3b3-d838c6dcc753', 9262819.3, -13.2, '2024-01-08 04:29:17'),
('61d68449-e3ed-4fc7-b8f3-603c5c099ad0', 2892692.95, 4.89, '2023-07-24 18:44:29'),
('a9c42568-3668-4750-93a4-b8798471acde', 8176245.28, -80.84, '2024-02-07 16:49:38'),
('79d7b45a-ba98-437f-95b0-aa21c071709c', 6376329.63, -17.35, '2023-11-02 15:29:19'),
('71fe4534-87fc-439f-b6c8-3022aa5e7d4b', 490177.73, -65.94, '2023-08-25 13:45:04'),
('5c0a56c3-5140-447d-b992-a7d7c44d472d', 8033241.77, -81.26, '2023-11-16 18:22:18'),
('bd1cf049-4f69-4180-a5d1-72f37beef632', 8113334.96, 18.99, '2023-07-17 01:23:37'),
('6f24990f-336d-460e-84ad-810d159bad88', 2083304.59, -80.93, '2023-09-27 23:20:39'),
('37e2ae04-638f-41cc-b838-4f7ebdd5f60b', 6278248.14, 8.44, '2023-11-29 20:52:03'),
('a498409d-df59-46da-8065-ecaabc4e9225', 5013546.73, -99.52, '2023-08-01 12:30:43'),
('b1972f5c-50d3-4c8e-b3d2-d2ad12c86277', 7883690.1, -95.76, '2024-01-17 21:08:06'),
('d9d14c29-f07f-4cb5-8271-0330825e8159', 9402337.34, 81.92, '2024-01-21 00:14:36'),
('4fc51811-2e51-4776-b9b5-181e5f422f6a', 4571470.93, -19.34, '2023-06-01 18:39:59'),
('ccfd8bd5-c2a1-4d13-bec1-74157854773a', 4718798.68, 95.35, '2024-02-06 03:40:01'),
('c2ecb47d-7b26-4e78-8b48-96a436c434bd', 1087744.03, 24.69, '2024-01-28 09:04:52'),
('5fc29456-3bcc-4b2c-9096-3c36bcfae126', 3256718.55, 68.1, '2023-08-07 10:29:19'),
('3b42e538-f6b8-4d8b-8778-9c052a581d58', 826579.41, -87.81, '2023-11-19 02:00:54');

INSERT INTO "public"."Sales" ("saleId", "productId", "timestamp", "quantity", "unitPrice", "totalAmount") VALUES
('df8a03fa-c69c-4ffe-9e28-5febfb7a5ca9', 'd35623ee-bef6-42b2-8776-2f99f8bb4782', '2023-11-02 04:03:00', 229, 221.1, 8012.55);
INSERT INTO "public"."Sales" ("saleId", "productId", "timestamp", "quantity", "unitPrice", "totalAmount") VALUES
('8d008094-bbb7-4b6f-a38c-0e2a9905322d', '8ac1ac77-7358-425e-be16-0bdde9f02e59', '2023-08-17 19:53:36', 241, 414.68, 5661.25);
INSERT INTO "public"."Sales" ("saleId", "productId", "timestamp", "quantity", "unitPrice", "totalAmount") VALUES
('4fca2797-3e88-40c5-88d3-fd4df8744958', '1afc136b-4d9f-4e8e-aace-8e1df908a404', '2023-11-21 15:03:18', 699, 550.22, 4708.54);
INSERT INTO "public"."Sales" ("saleId", "productId", "timestamp", "quantity", "unitPrice", "totalAmount") VALUES
('ae6a3d09-fdf8-407b-9e55-07a347c87efa', 'af84cc12-4fea-4f58-aece-f2ce92ca9580', '2023-05-17 20:20:03', 182, 113.69, 9419.4),
('f4dced2f-4446-450b-9778-fd32fe4dc583', '86e3bb1c-2f5d-4774-98f3-4df7cddd0a0f', '2023-06-14 15:17:34', 863, 214.01, 8942.2),
('b9c0856c-d10f-47a1-bf05-2f2c400aff69', '26b017c6-06d8-443f-9b4a-d6b1cee6f4c0', '2023-10-27 18:59:51', 985, 506.74, 1790.08),
('4411942c-1d3e-42b1-89bd-a692c43185b4', '440c9e80-6bf8-4eb3-b2d2-f81936d67de3', '2023-06-17 19:16:31', 607, 100.77, 3293.73),
('85460f0a-83d5-45b5-8db0-42506e0c5739', '98255f4e-40a6-470f-89a5-0792729f8947', '2024-01-12 16:37:28', 93, 310.09, 5531.81),
('1d9c4316-ed1a-49c5-a9ed-71a9fc8aff1c', '2a339fb2-f9f3-43bc-a85a-b217a0a38f12', '2023-11-08 18:16:52', 482, 83.62, 894.41),
('94a6ad98-8efe-4aef-bf19-742a542cf790', '8a8391b2-b4ac-4847-b652-66ffd8d65875', '2023-12-21 22:49:11', 285, 76.09, 3738.87),
('cff83ef4-6b2c-4ad4-b550-929e0eb3fa93', 'be2157fb-7454-405e-9511-bf7ba81b7726', '2023-11-21 15:03:43', 219, 606.43, 8773.57),
('bc6fbde5-325d-4918-b8d9-36d8a7be769f', 'fdf1ba3d-fa06-4ce5-90ff-d081c5d37176', '2024-03-01 17:35:27', 286, 246.58, 3328.18),
('022fe7a7-3938-4f41-9f56-f9e0a797f00f', 'afded6df-058f-477d-9878-e0e0b1d3dff3', '2023-06-27 12:09:45', 107, 891.26, 3915.37),
('e6fc26ef-50e8-4983-a7e0-f2cbf32d32ef', 'daa29167-82a7-474b-9687-b8b903e7ec69', '2023-07-06 02:50:19', 195, 809.59, 725.11),
('5ab2a0f1-2248-4804-9bf0-219d8a30b076', 'ccb83982-71f3-4497-bad8-7e64c6920dc6', '2023-03-18 01:14:42', 339, 662.74, 3694.96),
('a3659c0d-ccc6-4903-b035-6f13e7778253', '1936d406-e89e-40e4-bff7-1827532269d4', '2023-11-05 00:17:48', 71, 529.95, 2535.36),
('169eacd5-c2e3-4510-a102-12d4b8351401', 'c849a535-5f8b-47e3-889c-015693a644ac', '2023-11-03 18:34:59', 235, 769.19, 7007.95),
('a2241026-9fbb-438d-8f74-186bfa7c3174', '0c3e80ee-59b3-4fc4-b760-8b07acc2d3ae', '2024-01-04 00:19:37', 489, 965.72, 8759.91),
('6e1ef31f-9990-43d3-a8ba-54f535d450e9', 'd8f5bee3-f3eb-4071-a124-6b857e0fd798', '2023-07-29 03:12:53', 967, 486.31, 3167.8),
('ec369281-eefe-4a41-bcfc-f1f003ab8144', '8d15de86-0e4a-4414-9166-7a33610202d3', '2023-06-16 03:56:50', 371, 413.88, 668.91),
('7f455867-3226-43c8-9838-091356e52573', 'ea8fd0b9-c2d9-4d43-9c23-44cb99d079bb', '2023-12-03 20:33:41', 435, 477.74, 9592.66),
('a3ee350e-5dee-4ce3-831f-710da0067756', '25d01c80-bca1-4a00-b1d0-0fbd39ff9e89', '2023-12-27 16:34:21', 699, 336.99, 8316.35),
('c535a63e-376a-404e-b81e-4b448a06ac0e', '1d6df6e3-b7ea-4507-9d66-87c6ee8ed5b9', '2024-03-14 02:16:17', 540, 656.63, 9777.17),
('b7d157e1-0931-4ebe-8ca3-571cee3b597c', '000a8c23-5bca-436c-a216-4e747a94c511', '2024-02-13 07:28:00', 884, 899.96, 579.95),
('04ec2c14-ee2f-4485-9946-b154ed2df29a', 'c5b600dc-6bfb-492a-b335-c3cc8c707959', '2023-09-04 23:51:27', 106, 272.72, 8699.14),
('ca9f6794-b55e-4fb6-b76e-2e2e4d79d8f8', '9d5fafbc-312b-47e8-ada1-283918f0c3b5', '2023-06-27 17:57:01', 543, 15.84, 304.87),
('2fc702a0-8959-4794-9847-c99da26a83c2', '0114d5d4-ae48-46fa-b0ca-afe60eb88add', '2023-03-27 00:06:48', 262, 838.85, 5265.29),
('4d7f8590-2db0-4e05-9215-a5225eb99c1d', 'e5b0da8c-148d-4680-b262-8609fb8a10da', '2023-09-25 03:45:29', 485, 268.43, 5710.52),
('b3fb5092-8991-4f6d-8b01-05cc2fe624e5', '2be5b024-2c96-4f29-912c-c6f36353f799', '2023-04-01 01:39:53', 561, 783.41, 8189.57),
('877c1b5b-d3d5-4f92-b640-f1d74e2207cd', 'fcf2e432-62a3-4b6f-a34d-36e42a12272e', '2023-07-10 13:42:52', 333, 491.06, 6152.84),
('58de1711-bf0c-4a7e-9045-06e8dae2fb20', 'fc4c81e5-f1ac-40f5-8c6f-da3fbad5599d', '2023-09-06 15:15:47', 949, 120.98, 8873.08),
('ee74af3c-ef81-45d2-a6e6-d883ff816992', '07238d8e-0037-4972-87ca-0df206ee3e42', '2024-03-05 13:54:29', 2, 234.17, 7048.43),
('9c7317c6-39fa-4ab6-adb0-cde1a11c2f47', '154b7860-23a2-4564-ad99-1745ab7122ef', '2023-03-22 06:46:16', 292, 707.73, 2045.56),
('5d5b341f-82c6-439a-8d59-44b38733cb7a', '8d4bf814-65d4-4df4-84cc-68911d925fdf', '2023-06-12 18:25:57', 675, 243.48, 9259.03),
('d47eb898-5413-4492-ac54-cebb2422ebcf', 'a52bf1bd-3d35-4cd2-849a-354e3952e2d2', '2023-11-21 03:27:09', 7, 44.74, 9210.79),
('01ca19c0-c93a-464c-bc54-a14e9e80c55c', 'd35623ee-bef6-42b2-8776-2f99f8bb4782', '2024-01-17 01:48:30', 659, 497.62, 6661.77),
('9c03ee38-1424-4d47-bf27-4ad1441e0391', '8ac1ac77-7358-425e-be16-0bdde9f02e59', '2024-02-28 00:43:12', 818, 685.08, 8503.33),
('55880ad4-1b25-4c67-a21a-9c2e480752af', '1afc136b-4d9f-4e8e-aace-8e1df908a404', '2023-09-05 17:54:43', 578, 817.99, 1584),
('76515f08-ff03-46a5-8435-af7345ff9bab', 'af84cc12-4fea-4f58-aece-f2ce92ca9580', '2023-08-19 00:33:46', 491, 801.15, 3758.2),
('b84d883b-348a-4ea2-9f3b-7e9c6e841634', '86e3bb1c-2f5d-4774-98f3-4df7cddd0a0f', '2023-12-27 23:17:04', 281, 317.09, 6151.55),
('2be4ca15-1cfb-4b06-a87a-3494b02dacab', '26b017c6-06d8-443f-9b4a-d6b1cee6f4c0', '2023-11-18 12:30:37', 666, 690.3, 1522.01),
('3e1685c3-b8d1-49ac-8f00-15fb7f4e1a3d', '440c9e80-6bf8-4eb3-b2d2-f81936d67de3', '2024-01-22 17:28:27', 113, 54.35, 8803.88),
('446fca08-cdec-43c3-afe8-2c9b82016062', '98255f4e-40a6-470f-89a5-0792729f8947', '2023-03-29 14:37:25', 574, 605.86, 749.81),
('b84043c2-e60a-4c2f-9a10-6a56cedbb2a9', '2a339fb2-f9f3-43bc-a85a-b217a0a38f12', '2023-10-04 08:22:42', 26, 438.25, 9407.62),
('ca781bd3-fa61-4f5b-bdc2-3053531a9d2f', '8a8391b2-b4ac-4847-b652-66ffd8d65875', '2024-02-12 03:24:52', 452, 511, 8734.61),
('caa5f9b6-1458-4754-b0d1-19adebd562cf', 'be2157fb-7454-405e-9511-bf7ba81b7726', '2023-12-25 10:27:27', 484, 280.73, 5679.77),
('36a183a7-7abb-4f74-938b-b21801aa4c22', 'fdf1ba3d-fa06-4ce5-90ff-d081c5d37176', '2023-08-16 06:01:27', 260, 232.89, 3765.82),
('d62aaec8-35f2-44f2-ba46-5f024ddcb1c3', 'afded6df-058f-477d-9878-e0e0b1d3dff3', '2023-10-02 16:42:02', 718, 685.31, 6321.19),
('253c02a9-decd-4d11-bf40-9cf6d8c12562', 'daa29167-82a7-474b-9687-b8b903e7ec69', '2023-06-10 02:42:28', 297, 953.45, 2757.43),
('204bf1e8-c1ec-4c28-b209-4b3485983956', 'ccb83982-71f3-4497-bad8-7e64c6920dc6', '2023-07-16 21:58:15', 447, 777.27, 4574.02),
('8f2cc66d-1cee-4bdb-8d71-124f27c5de48', '1936d406-e89e-40e4-bff7-1827532269d4', '2023-06-17 10:37:35', 390, 855.29, 4044.96),
('3a28dbfa-758c-4f0f-a086-0b04e7dd94a7', 'c849a535-5f8b-47e3-889c-015693a644ac', '2024-01-31 06:04:28', 851, 170.23, 9399.42),
('12bd3ad4-b486-4515-9192-c2c2a33f97ff', '0c3e80ee-59b3-4fc4-b760-8b07acc2d3ae', '2023-05-03 13:57:12', 882, 973.95, 4241.28),
('d4fcfc21-9191-4419-a18d-a15282881274', 'd8f5bee3-f3eb-4071-a124-6b857e0fd798', '2023-10-22 01:09:46', 830, 200.27, 3059.84),
('00680af4-e08f-4360-bcb0-e5702edec5f9', '8d15de86-0e4a-4414-9166-7a33610202d3', '2023-05-09 15:02:48', 414, 924.09, 8604.22),
('86b7e33b-e09e-4cdd-ac75-ad2d563936d9', 'ea8fd0b9-c2d9-4d43-9c23-44cb99d079bb', '2023-03-23 16:14:23', 390, 792.89, 6503),
('baf92b24-73f7-45f8-8326-80c7d151472e', '25d01c80-bca1-4a00-b1d0-0fbd39ff9e89', '2024-02-22 07:16:30', 391, 685.29, 9900.96),
('dc8df228-0241-4cc0-95ee-3b5eda831524', '1d6df6e3-b7ea-4507-9d66-87c6ee8ed5b9', '2023-05-04 23:00:53', 309, 639.66, 9964.61),
('201e23c6-6ddc-4dc9-8e39-b6fb81404fcf', '000a8c23-5bca-436c-a216-4e747a94c511', '2023-08-23 17:23:35', 325, 471.59, 7706.41),
('603586d5-2f86-4c3e-9acf-cdffd433f702', 'c5b600dc-6bfb-492a-b335-c3cc8c707959', '2024-02-22 06:16:55', 857, 197.36, 760.65),
('5253cf24-44e6-4f86-8abe-d827a088ee9b', '9d5fafbc-312b-47e8-ada1-283918f0c3b5', '2023-12-15 21:21:09', 25, 158.12, 243.15),
('31de695e-9c3d-433b-a5d5-3af401d2763e', '0114d5d4-ae48-46fa-b0ca-afe60eb88add', '2024-02-06 13:55:02', 757, 283.2, 7420.27),
('beffcc21-4fa2-4abf-9ddf-03a68651f751', 'e5b0da8c-148d-4680-b262-8609fb8a10da', '2023-05-20 14:26:19', 580, 659.75, 5018.42),
('7c9389c3-87f0-454d-9ab3-f9c8fb28f082', '2be5b024-2c96-4f29-912c-c6f36353f799', '2023-07-01 04:46:47', 948, 620.57, 7555.21),
('ada3165e-5ce6-45b9-95d5-4665b223f221', 'fcf2e432-62a3-4b6f-a34d-36e42a12272e', '2023-03-25 13:26:56', 960, 989.43, 1188.7),
('e8829f25-7ce4-44cd-bab9-277e1d2d170c', 'fc4c81e5-f1ac-40f5-8c6f-da3fbad5599d', '2023-05-29 02:29:01', 667, 357.37, 6196.09),
('984b0d72-f6ea-49ac-960f-f4027d2ea67b', '07238d8e-0037-4972-87ca-0df206ee3e42', '2023-03-15 22:27:44', 623, 467.77, 6657.9),
('3027a79c-8583-4585-b618-a31344cb8acb', '154b7860-23a2-4564-ad99-1745ab7122ef', '2023-03-17 09:21:59', 23, 945.27, 7870.76),
('90f35bc0-3617-4cb6-9754-923c814991fd', '8d4bf814-65d4-4df4-84cc-68911d925fdf', '2024-01-29 09:24:28', 140, 664, 7582.02),
('5c86a794-9fac-4a1e-9c5a-01282a0b166e', 'a52bf1bd-3d35-4cd2-849a-354e3952e2d2', '2023-05-25 21:06:21', 127, 185.81, 4970.67),
('ec033faa-a469-48d5-b5e1-108413f12d07', 'd35623ee-bef6-42b2-8776-2f99f8bb4782', '2023-12-12 16:58:27', 178, 422.07, 169.06),
('0e8f8555-4af9-44a8-b32e-bc6d5d1b0de0', '8ac1ac77-7358-425e-be16-0bdde9f02e59', '2023-03-23 10:36:36', 295, 536.74, 7652.54),
('2ac5fd37-ad3e-4a22-b37b-70603a30d82e', '1afc136b-4d9f-4e8e-aace-8e1df908a404', '2023-08-28 07:08:56', 338, 304.83, 137.98),
('4ac03bce-3d3a-4d93-af99-9c7bc54e5168', 'af84cc12-4fea-4f58-aece-f2ce92ca9580', '2024-02-15 09:35:47', 65, 951.61, 7558.27),
('e354821f-9808-487c-b466-3d3a1c7bc762', '86e3bb1c-2f5d-4774-98f3-4df7cddd0a0f', '2023-11-25 20:30:36', 171, 305.65, 4647.58),
('0ff9d397-db60-4281-8c51-73d6665003dd', '26b017c6-06d8-443f-9b4a-d6b1cee6f4c0', '2024-02-15 23:11:52', 610, 428.16, 3294.23),
('1a5873ef-8484-40b0-a9fd-d6c11e441e61', '440c9e80-6bf8-4eb3-b2d2-f81936d67de3', '2024-03-10 20:18:24', 579, 129.19, 488.19),
('d55ca8e1-ffff-439d-a55b-f0b9eb8f848e', '98255f4e-40a6-470f-89a5-0792729f8947', '2023-07-26 01:38:07', 186, 544.82, 2989.5),
('e90068e8-55c5-400d-a805-7dbab388138a', '2a339fb2-f9f3-43bc-a85a-b217a0a38f12', '2023-09-24 10:51:03', 540, 541.07, 3861.48),
('32eba028-2991-406a-90ca-600beb4f67db', '8a8391b2-b4ac-4847-b652-66ffd8d65875', '2023-06-29 10:24:41', 661, 78.07, 2467.93),
('7c17b19e-17ef-4d37-9233-6ad31bd85b23', 'be2157fb-7454-405e-9511-bf7ba81b7726', '2023-12-02 12:10:55', 635, 52.5, 4393.68),
('729cfe78-6698-4a32-9c78-51ada37cfb36', 'fdf1ba3d-fa06-4ce5-90ff-d081c5d37176', '2023-10-29 22:49:12', 733, 349.87, 2736.72),
('48afeac9-385d-4ff3-9e7f-0a6787ec1958', 'afded6df-058f-477d-9878-e0e0b1d3dff3', '2023-11-07 08:57:27', 268, 700.99, 7115.25),
('0831a92f-4c18-4de6-a9d3-96ec3352603d', 'daa29167-82a7-474b-9687-b8b903e7ec69', '2024-01-11 03:57:45', 387, 382.34, 2575.24),
('2888cfa2-b9ef-4e6d-8c62-014734591691', 'ccb83982-71f3-4497-bad8-7e64c6920dc6', '2023-11-23 13:32:43', 420, 596.87, 3294.5),
('40bd92ec-084e-415e-ba4b-2d12d826ca36', '1936d406-e89e-40e4-bff7-1827532269d4', '2023-04-16 18:59:38', 678, 947.48, 7363.69),
('2ba6fdbb-81c8-4af2-8adb-0505033a3c98', 'c849a535-5f8b-47e3-889c-015693a644ac', '2024-01-27 13:21:55', 626, 731.66, 9487.24),
('fc3006ad-f883-4f43-86ee-8c1a4f2c7248', '0c3e80ee-59b3-4fc4-b760-8b07acc2d3ae', '2023-11-02 09:32:22', 732, 366.09, 4384.09),
('8b6c8765-001c-4a54-91e2-761394f1a700', 'd8f5bee3-f3eb-4071-a124-6b857e0fd798', '2023-04-21 22:19:20', 368, 37.27, 5510.41),
('b830c1e8-ed9a-4893-b6d2-68b87b991453', '8d15de86-0e4a-4414-9166-7a33610202d3', '2023-09-14 06:10:36', 426, 257.98, 5241.93),
('eeaa3b86-09ae-46aa-9b58-6354713c23cd', 'ea8fd0b9-c2d9-4d43-9c23-44cb99d079bb', '2023-05-09 05:06:12', 228, 205.53, 2448.67),
('8579fa47-cd55-477e-9bc0-77f7975c91c6', '25d01c80-bca1-4a00-b1d0-0fbd39ff9e89', '2023-07-09 23:55:58', 147, 304.11, 646.37),
('d5436830-dc0a-4f7b-b96b-ca96c10f7b36', '1d6df6e3-b7ea-4507-9d66-87c6ee8ed5b9', '2023-06-25 14:57:39', 700, 574.25, 6103.38),
('477e5f5d-c44c-4f3a-b4c4-8a85924fe01b', '000a8c23-5bca-436c-a216-4e747a94c511', '2023-04-10 13:26:52', 400, 49.43, 1860.5),
('bfbe67c7-3d3b-471c-a999-d2ea8a9594d0', 'c5b600dc-6bfb-492a-b335-c3cc8c707959', '2023-11-17 17:02:08', 654, 825.63, 6998.87),
('156a5c20-6338-41e2-b9ab-dbcb40905925', '9d5fafbc-312b-47e8-ada1-283918f0c3b5', '2023-03-20 16:53:47', 125, 237.24, 6603.67),
('6d4ab0ae-5d49-4731-b099-d8e155fb49d1', '0114d5d4-ae48-46fa-b0ca-afe60eb88add', '2023-06-14 08:48:03', 677, 479.94, 7760.82),
('81aa20f8-591f-47e6-8bad-7ad3e3003f81', 'e5b0da8c-148d-4680-b262-8609fb8a10da', '2023-06-30 12:47:06', 555, 410.27, 9330.17),
('a93e6a0c-d178-4889-b2ae-ba0325d9051f', '2be5b024-2c96-4f29-912c-c6f36353f799', '2023-11-24 12:14:40', 508, 558.25, 4006.69),
('4a2575dd-8861-46ce-80ad-74f488d79a5a', 'fcf2e432-62a3-4b6f-a34d-36e42a12272e', '2023-09-16 14:34:18', 259, 368.39, 5611.94);

INSERT INTO "public"."SalesSummary" ("salesSummaryId", "totalValue", "changePercentage", "date") VALUES
('9234a776-e6ac-46e2-bc24-c959ce216751', 4754106.83, 61.51, '2023-03-18 22:32:25');
INSERT INTO "public"."SalesSummary" ("salesSummaryId", "totalValue", "changePercentage", "date") VALUES
('e5648831-7d0e-4ef5-8e04-f6e6a0eaafb1', 1512948.97, -2.28, '2023-09-03 13:50:20');
INSERT INTO "public"."SalesSummary" ("salesSummaryId", "totalValue", "changePercentage", "date") VALUES
('785d33be-a1d8-47a6-b1d3-779942196b5c', 5545737.54, -55.29, '2023-07-28 13:16:27');
INSERT INTO "public"."SalesSummary" ("salesSummaryId", "totalValue", "changePercentage", "date") VALUES
('0541d262-46aa-4961-b7c0-ce09143ccf34', 3260113.92, -71.7, '2023-05-16 08:32:38'),
('185bb7e9-a9c0-4691-87d3-ca597a29e4d8', 849737.25, 9.16, '2023-08-26 05:41:40'),
('6a1cb0f7-a4e1-4157-800d-86a59fb5fc16', 98903.57, 36.24, '2023-09-02 01:49:46'),
('7d6d3e60-4687-40e3-9a77-452ea298df02', 973557.25, 34.22, '2023-03-31 15:20:53'),
('7e071f0f-cff2-4699-bc67-3bee1114cb9e', 9761085.56, -57.32, '2023-06-25 12:21:04'),
('6688c13c-758a-44c9-a291-d630d13dfd33', 9819343.72, -49.57, '2023-06-21 17:57:01'),
('bce35149-3c37-4a0d-8963-c9f550b262f3', 2757578.95, 73.95, '2023-05-13 15:02:46'),
('4d86c2df-d759-49df-9ecd-1eaf27a3d590', 8894817.67, -25.81, '2023-03-31 16:04:25'),
('c85efa84-d294-4c2e-a9a5-8774d92af8bf', 2882180.14, 57.29, '2024-03-13 01:19:11'),
('9257a2eb-d1ba-4cde-a0c2-cdf766c8c79c', 543716.99, 8.85, '2024-02-04 05:14:46'),
('2f94d909-0f3a-45fb-8072-5054b6dba2d6', 1171786.52, 79.4, '2023-04-20 00:12:05'),
('9bc6eca5-9f18-4e72-bed0-7a98bb759af3', 9574424.72, 10.42, '2023-04-04 22:57:17'),
('a0979a0f-bbe2-4bd8-9639-e6c1d890c6e1', 1717855.75, -76.77, '2023-07-24 23:01:04'),
('d2ff270c-63d9-4510-9524-91cb95494a9d', 1328587.6, 62.35, '2023-12-30 03:52:12'),
('56693648-d829-4d6a-8ff1-379ed00187c0', 3363438.49, -3.73, '2023-06-16 12:55:40'),
('22c58913-c4ad-44ac-bcf0-6309b6c61f26', 6253195.27, -33.39, '2023-05-12 13:22:28'),
('e14f2cdc-28c8-4041-a5c3-444e32f4df96', 759235.03, -70.16, '2023-05-04 03:54:06'),
('abb07538-994f-40df-9850-b93d758566d6', 8849902.08, 49.99, '2023-10-23 10:52:58'),
('3c1be92e-86a4-4ba9-9cc4-0cd25cdd9b53', 6985354.53, -45.28, '2023-06-12 08:59:54'),
('b6438519-cd43-49e4-a6ea-c1e97b6b9f4f', 1977818.88, -1.73, '2023-07-30 18:47:25'),
('47d22ba7-a75b-4570-a0ee-5936af301dc0', 3051711.61, 46.06, '2023-06-21 19:26:53'),
('75bf9bb7-67bf-4674-8d57-ef96c387bd5f', 1776483.92, 5.92, '2024-01-04 23:05:09'),
('aa076cf0-2af4-42d1-a65a-e21048900cdc', 8008789.18, -92.62, '2023-07-11 05:46:12'),
('0eabb55c-311b-4794-8621-684b8e3c6af3', 9939857.2, 43.61, '2023-11-03 17:55:50'),
('02421d34-eab8-4c74-be90-29ae960217e0', 7378147.37, -8.68, '2023-06-02 21:55:25'),
('dab41155-3b2c-4260-9b92-0fb36239e76a', 5903962.21, 54.41, '2023-04-15 12:08:49'),
('777946fe-c45b-48c4-8009-dd34727a2d6e', 3995392.55, -39.88, '2023-06-04 10:27:19'),
('0218422f-dff4-4b96-a485-ec81dfb52b1d', 2236665.35, 62.25, '2023-04-26 18:00:10'),
('2cdc1dff-3f48-4223-b75d-6d40d5ebd70f', 4924895.6, 91.7, '2023-10-03 09:22:11'),
('2876f4ae-7146-4144-a424-1050d3889af9', 8020749.83, -53.71, '2023-09-09 18:08:04'),
('72d4764c-6438-43e8-9f5e-1e1392c49daa', 1401814.98, -62.89, '2024-01-23 21:18:15'),
('0eb49bc9-7bb1-4593-b63c-623604b4d39e', 7075340.95, 51.63, '2023-04-12 18:35:19'),
('a03badbe-ed85-4f67-8563-e70957d711f5', 6635158.49, 1.55, '2024-01-08 18:20:24'),
('ef37f796-5792-48b5-947b-0861d1bcf1d2', 5438733.13, 64.23, '2023-06-04 03:34:31'),
('38f4698c-f973-4118-a38f-0c772dc55993', 8733498.2, -9.14, '2023-06-18 12:45:24'),
('bb7b3f86-95f6-414a-95c5-d6ad13a50e3b', 8834598.88, -74.91, '2023-09-18 22:57:29'),
('6f673a1d-78e9-4ea8-91e2-d7a32836cd3a', 1518126.03, 22.59, '2024-02-17 06:29:57'),
('ac08ecc4-f5e2-4f65-8f7d-3e9e02771657', 8916033.73, -70.49, '2023-11-23 06:52:42'),
('3245bcab-7939-43ef-8f75-66bb2e092637', 8457395.47, 58.85, '2023-06-14 06:58:44'),
('211ab48b-03e9-4e87-aff8-24723760c650', 2131348.79, -46.72, '2023-04-07 03:15:00'),
('6bff1b90-9e27-493b-aead-d70b388c5058', 4439655.91, -10.54, '2023-08-08 00:53:14'),
('b2cd84fc-8f66-477a-ad53-eb7826b89eae', 2253721.94, -26.4, '2023-12-04 03:33:12'),
('db47a861-5062-49c5-92c1-0a8f13ec70b0', 3844322.3, -23.92, '2023-07-18 05:39:04'),
('47ab518f-ec0e-4793-8d3b-53780452e472', 3145456.83, -80.96, '2023-05-18 14:04:36'),
('2f255c3a-d024-4a49-9e3e-3ff4e529c362', 5041224.3, 50.26, '2023-08-15 23:43:31'),
('1344c490-9f30-4a09-8379-e26dc551599e', 8409410.21, 27.52, '2024-01-01 14:21:37'),
('f9e8bb8b-b267-49d9-b621-7f912b348e81', 4049054.53, -9.75, '2023-04-08 22:11:59');

INSERT INTO "public"."Users" ("userId", "name", "email") VALUES
('3b0fd66b-a4d6-4d95-94e4-01940c99aedb', 'Carly', 'cvansalzberger0@cisco.com');
INSERT INTO "public"."Users" ("userId", "name", "email") VALUES
('d9d323fa-5c98-4222-a352-120e1f5e2798', 'Inesita', 'imcconnachie1@oaic.gov.au');
INSERT INTO "public"."Users" ("userId", "name", "email") VALUES
('9e2895ae-4afe-4ff2-b3b3-be15cf1c82d6', 'Tulley', 'tbridywater2@wikimedia.org');
INSERT INTO "public"."Users" ("userId", "name", "email") VALUES
('c7072fb5-cd2b-4703-8a58-328e5b7ed95a', 'Amelia', 'atondeur3@posterous.com'),
('22c29051-d301-4cc2-86dd-c19695408adb', 'Bucky', 'btompkin4@moonfruit.com'),
('6ac28937-bc05-4c0a-be7e-1a332e2de312', 'Sherline', 'sinston5@issuu.com'),
('552c1c73-e324-47ee-bf7f-b0dfbeb59788', 'Leontine', 'lchartres6@edublogs.org'),
('962c8a6b-c914-4aa4-93bc-2b91188a1a58', 'Cloris', 'cmorrall7@un.org'),
('35393a7a-f41b-4fe9-8901-fc39a8f803d6', 'Tobiah', 'trubinchik8@time.com'),
('9cf146a9-3da9-47fe-bcc3-3abdeb3a375d', 'Colet', 'cmincini9@dell.com'),
('4a6efba9-61a2-4829-abe6-dfed18484737', 'Van', 'vswaitea@imdb.com'),
('6718765e-123c-42d4-b2b3-efc029ff854e', 'Mella', 'mheartyb@sphinn.com'),
('0880eb85-2a08-4898-8aae-3cf90c48b08b', 'Karyl', 'kmatteic@live.com'),
('2977c5fe-22be-454a-80e1-5b93db92a371', 'Berrie', 'bnortcliffed@linkedin.com'),
('bd909a0b-f665-451a-a052-8e8111e796e3', 'Giselle', 'gsollitte@weibo.com'),
('26409ed7-15ac-4695-9813-be2afb6dad26', 'Niall', 'nrebeirof@netvibes.com'),
('80697f6f-69bc-4b03-82c0-40f48884f716', 'Afton', 'ajozaitisg@craigslist.org'),
('15d25fd9-32da-4ac7-b1b6-589a90a41dbf', 'Letisha', 'lgrimsdykeh@blogger.com'),
('0bd8b2b2-d67f-47dc-9acc-d2311006852b', 'Julio', 'jcuniami@weibo.com'),
('e83bae68-8104-4847-9f08-98206f35d100', 'Dana', 'dstrugnellj@51.la'),
('a4cf8f1f-8c61-404d-834d-220202358f91', 'Gertie', 'gmacrok@networkadvertising.org'),
('e091dbc4-0fc5-4823-9fc4-1cdded1fc5f4', 'Vidovik', 'vriddettl@usgs.gov'),
('e9ceef74-fb81-41e0-b52e-0089b978b2f3', 'Yancey', 'yfentemm@51.la'),
('9d82ca0e-cb41-4fba-a73f-acb7388e9d12', 'Lyndell', 'ldurninn@sciencedirect.com'),
('ecea4d11-d41e-468a-85d3-e80a193a5620', 'Heidie', 'hrackhamo@craigslist.org'),
('29232f0d-2423-406f-956b-00ddf9540ac8', 'Clem', 'cthorbonp@smugmug.com'),
('afd4a67e-83ba-4a62-9cdc-2fdc0c553b29', 'Paten', 'pblasdaleq@quantcast.com'),
('2a26982f-498f-4599-ab54-bc7469e2fbfd', 'Daisi', 'dsedgwickr@addthis.com'),
('c876a2cc-7528-4b61-837b-b7f7efc62cca', 'Sara-ann', 'sblundels@csmonitor.com');
