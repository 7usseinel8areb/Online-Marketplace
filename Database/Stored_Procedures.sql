/*
	thanks for your efforts but not all the stored are created please make sure to create the remaining

	1- the table's primary key is not identity so inserting without will result with an error 
*/
create procedure CreateUser
    @Username nvarchar(250), 
    @Email nvarchar(250), 
    @PasswordHash nvarchar(max), 
    @Status nvarchar(250),
    @AddressLine1 nvarchar(250), 
    @AddressLine2 nvarchar(250), 
    @City nvarchar(250), 
    @State nvarchar(250),
    @PostalCode nvarchar(10), 
    @CountryID int
as
begin
    insert into Users
    (
        Username,
        Email,
        PasswordHash,
        [Status],
        AddressLine1,
        AddressLine2,
        City,
        [State],
        PostalCode,
        CountryID
    )
    VALUES
    (
        @Username,
        @Email,
        @PasswordHash,
        @Status,
        @AddressLine1,
        @AddressLine2,
        @City,
        @State,
        @PostalCode,
        @CountryID
    );
end;
Go


------------------------------------------------------------------------------------------------------------


create procedure CreateItem(
	@SellerID int,
	@CategoryID int,
	@Title nvarchar(100),
	@Description nvarchar(max),
	@StartingPrice decimal,
	@CurrentPrice decimal,
	@StartDate Datetime,
	@EndDate Datetime,
	@ImageURL nvarchar(250)
)
as 
begin
	insert into Items(SellerID, CategoryID, Title, [Description],
	 StartingPrice, CurrentPrice, StartDate, EndDate,
	 ImageURL)
	values(@SellerID, @CategoryID, @Title, @Description,
 @StartingPrice, @CurrentPrice, @StartDate, @EndDate,
 @ImageURL)
end;
Go


------------------------------------------------------------------------------------------------------------

create procedure PlaceBid(
	@ItemID int, 
	@UserID int,
	@BidAmount decimal
)
as 
begin
	insert into Bids(ItemId,UserId,BidAmount,BidTime)
	values (
	@ItemID, @UserID, @BidAmount,GetDate()
	)
end;
GO



------------------------------------------------------------------------------------------------------------



create procedure UpdateUserStatus(
	@UserId int,
	@Status nvarchar(10)
)
as 
begin 
	update Users set [Status] = @Status
	where UserId = @UserId
end;
GO

