Sub Cari()
'
' Cari Macro
'
If Sheet1.PTN.Text = "Pilih PTN" Or Sheet1.PRODI.Text = "Pilih PRODI" Or Sheet1.AVGUTBK = "Skor" Then
    MsgBox "PTN, PRODI, dan Skor Rata-rata UTBK wajib diisi", vbExclamation, "Data tidak lengkap"
Else
    findID = Sheet1.PTN.Text + Sheet1.PRODI.Text
    bar = Sheet4.Application.WorksheetFunction.Match(findID, Sheet9.Range("Q:Q"), 0) 'BARIS KEBERAPA

    Sheet1.KODEPRODI.Text = Sheet9.Cells(bar, 3)
    
    'Sheet1.MINIMAL.Text = Sheet9.Cells(bar, 14) 'udah bener cuma rata2
    Sheet1.MINIMAL.Text = Sheet9.Cells(bar, 11)
    
    If Sheet1.MINIMAL.Text = "-" Then
        Sheet1.PREDIKSI.Text = "-"
        Sheet1.PREDIKSI.BackColor = &HFFFF& 
        Sheet1.PREDIKSI.ForeColor = &H0&
    Else
        If Sheet1.AVGUTBK.Text >= Sheet1.MINIMAL.Text Then
            Sheet1.PREDIKSI.Text = "AMAN"
            Sheet1.PREDIKSI.BackColor = &H8000&     'green
            Sheet1.PREDIKSI.ForeColor = &HFFFFFF    'white
        ElseIf Sheet1.AVGUTBK.Text >= Sheet9.Cells(bar, 12) Then
            Sheet1.PREDIKSI.Text = "KURANG AMAN"
            Sheet1.PREDIKSI.BackColor = &HFFFF&     'yellow
            Sheet1.PREDIKSI.ForeColor = &H0&        'black
        Else
            Sheet1.PREDIKSI.Text = "TIDAK AMAN"
            Sheet1.PREDIKSI.BackColor = &HFF&       'red
            Sheet1.PREDIKSI.ForeColor = &HFFFFFF    'white
        End If
        
    End If
    
End If
End Sub
