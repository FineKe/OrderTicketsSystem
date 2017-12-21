package com.litesky.model;

import java.io.Serializable;
import java.util.List;

/**
 * @author finefine.com
 */
public class Page implements Serializable {
    private static final long serialVersionUID = -1549028989698134093L;
    private int total;
    private List<Line> rows;
    private int offset;
    private int limit;

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public List<Line> getRows() {
        return rows;
    }

    public void setRows(List<Line> rows) {
        this.rows = rows;
    }

    public int getOffset() {
        return offset;
    }

    public void setOffset(int offset) {
        this.offset = offset;
    }

    public int getLimit() {
        return limit;
    }

    public void setLimit(int limit) {
        this.limit = limit;
    }
}
