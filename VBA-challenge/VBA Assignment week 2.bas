Attribute VB_Name = "Module2"
Sub stock_stats():

Dim ticker As String
Dim number_tickers As Integer
Dim lastRowState As Long
Dim opening_price As Double
Dim closing_price As Double
Dim yearly_change As Double
Dim percent_change As Double
Dim total_stock_volume As Double
Dim greatest_percent_increase As Double
Dim greatest_percent_increase_ticker As String
Dim greatest_percent_decrease As Double
Dim greatest_percent_decrease_ticker As String
Dim greatest_stock_volume As Double
Dim greatest_stock_volume_ticker As String

' loop over each worksheet in the workbook
For Each ws In Worksheets

    ' Make the worksheet active.
    ws.Activate

    ' Find the last row of each worksheet
    lastRowState = ws.Cells(Rows.Count, "A").End(xlUp).Row

    ws.Range("I1").Value = "Ticker"
    ws.Range("J1").Value = "Yearly Change"
    ws.Range("K1").Value = "Percent Change"
    ws.Range("L1").Value = "Total Stock Volume"
    
    number_tickers = 0
    ticker = ""
    yearly_change = 0
    opening_price = 0
    percent_change = 0
    total_stock_volume = 0
    
    For i = 2 To lastRowState

        ' Get the value of the ticker symbol we are currently calculating for.
        ticker = Cells(i, 1).Value
        
        ' Get the start of the year opening price for the ticker.
        If opening_price = 0 Then
            opening_price = Cells(i, 3).Value
        End If
        
        ' Add up the total stock volume values for a ticker.
        total_stock_volume = total_stock_volume + Cells(i, 7).Value
        
                  If opening_price = 0 Then
                percent_change = 0
            Else
                percent_change = (yearly_change / opening_price)
            End If
            
            
            ' Format the percent_change value as a percent.
            Cells(number_tickers + 1, 11).Value = Format(percent_change, "Percent")
            
            opening_price = 0
                        Cells(number_tickers + 1, 12).Value = total_stock_volume
            
            total_stock_volume = 0
            
    
    
        
    Next i
    

    Range("O2").Value = "Greatest % Increase"
    Range("O3").Value = "Greatest % Decrease"
    Range("O4").Value = "Greatest Total Volume"
    Range("P1").Value = "Ticker"
    Range("Q1").Value = "Value"
    
    lastRowState = ws.Cells(Rows.Count, "I").End(xlUp).Row
    

    greatest_percent_increase = Cells(2, 11).Value
    greatest_percent_increase_ticker = Cells(2, 9).Value
    greatest_percent_decrease = Cells(2, 11).Value
    greatest_percent_decrease_ticker = Cells(2, 9).Value
    greatest_stock_volume = Cells(2, 12).Value
    greatest_stock_volume_ticker = Cells(2, 9).Value
    
  
    For i = 2 To lastRowState
    
        If Cells(i, 11).Value > greatest_percent_increase Then
            greatest_percent_increase = Cells(i, 11).Value
            greatest_percent_increase_ticker = Cells(i, 9).Value
        End If

        If Cells(i, 11).Value < greatest_percent_decrease Then
            greatest_percent_decrease = Cells(i, 11).Value
            greatest_percent_decrease_ticker = Cells(i, 9).Value
        End If
        

        If Cells(i, 12).Value > greatest_stock_volume Then
            greatest_stock_volume = Cells(i, 12).Value
            greatest_stock_volume_ticker = Cells(i, 9).Value
            
        End If
        
    Next i
    
    Range("P2").Value = Format(greatest_percent_increase_ticker, "Percent")
    Range("Q2").Value = Format(greatest_percent_increase, "Percent")
    Range("P3").Value = Format(greatest_percent_decrease_ticker, "Percent")
    Range("Q3").Value = Format(greatest_percent_decrease, "Percent")
    Range("P4").Value = greatest_stock_volume_ticker
    Range("Q4").Value = greatest_stock_volume
    
Next ws


End Sub

