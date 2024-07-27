create table Countries(
	CountryId int primary Key,
	CountryName nvarchar(150)
);
Go

create table Users(
	UserId int primary key,
	Username nvarchar(100),
	Email nvarchar(250),
	PasswordHash varchar(max),
	[Status] varchar(20),
	AddressLine1 nvarchar(250) ,
	AddressLine2 nvarchar(250) ,
	City nvarchar(100),
	[State] nvarchar(100),
	PostalCode varchar(50),
	CountryId int,
	CreatedAt  Datetime default getDate(),


	Foreign key (CountryId) references Countries(CountryId)

);
Go


create table Categories(
	CategoryID int Primary Key,
	CategoryName nvarchar(150),
	[Description] nvarchar(max)
);
Go


create table Items(
	ItemID int primary Key,
	SellerID int,
	CategoryID int,
	Title nvarchar(150),
	[Description] nvarchar(max),
	StartingPrice decimal,
	CurrentPrice decimal,
	StartDate DateTime,
	EndDate DateTime,
	ImageURL nvarchar(max),
	CreatedAt DateTime,

	Foreign Key (SellerID) references Users(UserId),
	Foreign Key (CategoryId) references Categories(CategoryId),
);
Go


create table Bids(
	BidID int Primary Key,
	ItemID int,
	UserID int,
	BidAmount decimal,
	BidTime DateTime,

	foreign Key (ItemId) references Items(ItemId),
	Foreign Key (UserId) references Users(UserId)
);
Go


create table Orders(
	OrderID int Primary Key,
	BuyerID int,
	ItemID int,
	OrderDate DateTime,
	TotalAmount decimal,

	Foreign Key (BuyerId) references Users(UserId),
	foreign Key (ItemId) references Items(ItemId)
);
Go


create table [Notification](
	NotificationID int Primary Key,
	UserID int,
	[Message] nvarchar(max),
	IsRead bit,
	CreatedAt DateTime

	Foreign Key (UserID) references Users(UserId),

);
Go