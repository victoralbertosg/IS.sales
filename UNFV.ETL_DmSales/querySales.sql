select detord.ProductID,prod.ProveedorId, ord.Date, ord.customerID, ord.employeeID, detord.Discount,detord.Quantity,detord.UnitPrice,ord.ordenID   from [dbo].[StageOrder]  as ord
inner join [dbo].[StageDetailOrder] as detord on(ord.ordenID=detord.ordenID)
inner join [dbo].[StageProducto] as prod on (detord.productID=prod.ProductID)
inner join  [dbo].[StageProvider] as prov on (prod.ProveedorID=prov.ProveedorID)

------sales
CREATE TABLE [dbo].[Sales](
	[SalesKey] [int] identity(1,1) NOT NULL,
	[ordenID] [int] NOT NULL,
	[customerKey] [int] NULL,
	[employeeKey] [int] NULL,
	[providerKey] [int] NULL,
	[dateKey] [int] NULL,	
	[productKey] [int]  NULL,
	[UnitPrice] [money]  NULL,
	[Quantity] [smallint] NULL,
	[Discount] [real]  NULL,
	[InsertAuditKey] [int] NOT NULL,
	[UpdateAuditKey] [int] NOT NULL,
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Sales]  WITH CHECK ADD  CONSTRAINT [FKsales__dimCustomer] FOREIGN KEY([customerKey])
REFERENCES [dbo].[DimCustomer] ([customerKey])
GO

ALTER TABLE [dbo].[Sales]  WITH CHECK ADD  CONSTRAINT [FKsales__dimEmployee] FOREIGN KEY([employeeKey])
REFERENCES [dbo].[DimEmployee] ([employeeKey])
GO
ALTER TABLE [dbo].[Sales]  WITH CHECK ADD  CONSTRAINT [FKsales__dimProvider] FOREIGN KEY([providerKey])
REFERENCES [dbo].[DimProvider] ([providerKey])
GO
ALTER TABLE [dbo].[Sales]  WITH CHECK ADD  CONSTRAINT [FKsales__dimProduct] FOREIGN KEY([productKey])
REFERENCES [dbo].[DimProduct] ([productKey])
GO
ALTER TABLE [dbo].[Sales]  WITH CHECK ADD  CONSTRAINT [FKsales__dimTime] FOREIGN KEY([dateKey])
REFERENCES [dbo].[DimTime] ([timeKey])
GO
----------------
