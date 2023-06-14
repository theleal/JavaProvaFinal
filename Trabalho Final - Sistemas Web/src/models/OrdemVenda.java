package models;

import java.util.Date;

public class OrdemVenda {
    private int ordNo;
    private double purchAmt;
    private Date ordDate;
    private int customerId;
    private int salesmanId;

    public OrdemVenda() {
    }

    public OrdemVenda(int ordNo) {
        this.ordNo = ordNo;
    }

    public OrdemVenda(double purchAmt, Date ordDate, int customerId, int salesmanId) {
        this.purchAmt = purchAmt;
        this.ordDate = ordDate;
        this.customerId = customerId;
        this.salesmanId = salesmanId;
    }
    
    public OrdemVenda(int ordNo, double purchAmt, Date ordDate, int customerId, int salesmanId) {
        this(ordNo);
        this.purchAmt = purchAmt;
        this.ordDate = ordDate;
        this.customerId = customerId;
        this.salesmanId = salesmanId;
    }

    public int getOrdNo() {
        return ordNo;
    }

    public void setOrdNo(int ordNo) {
        this.ordNo = ordNo;
    }

    public double getPurchAmt() {
        return purchAmt;
    }

    public void setPurchAmt(double purchAmt) {
        this.purchAmt = purchAmt;
    }

    public Date getOrdDate() {
        return ordDate;
    }

    public void setOrdDate(Date ordDate) {
        this.ordDate = ordDate;
    }

    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }

    public int getSalesmanId() {
        return salesmanId;
    }

    public void setSalesmanId(int salesmanId) {
        this.salesmanId = salesmanId;
    }
}
