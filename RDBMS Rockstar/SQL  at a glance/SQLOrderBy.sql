Use Library;

Select Name, Author, Price From Book
	Order By Price Desc; -- output will return descending order
    
    
Select Name, Author, Price From Book
	Order By Price Desc
    Limit 5 -- how much we want
    Offset 3; -- offset will skip