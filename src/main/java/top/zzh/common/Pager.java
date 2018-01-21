package top.zzh.common;

import java.util.List;

/**
 * 分页类
 */
public class Pager {

    private Integer pageNo;
    private Integer pageSize;

    private List<Object> rows;
    private Long total;
    private Long pages;

    public Pager() {
    }

    public Pager(Integer pageNo, Integer pageSize) {
        this.pageNo = pageNo;
        this.pageSize = pageSize;
    }

    public Integer getPageNo() {
        return pageNo;
    }

    public void setPageNo(Integer pageNo) {
        this.pageNo = pageNo;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }

    public List<Object> getRows() {
        return rows;
    }

    public void setRows(List<Object> rows) {
        this.rows = rows;
    }

    public Long getTotal() {
        return total;
    }

    public void setTotal(Long total) {
        this.total = total;
    }

    public void setPages(Long pages) {
        this.pages = pages;
    }

    public Integer getBeginIndex() {
        return (pageNo - 1) * pageSize;
    }

    public Long getPages() {
        long num = total % pageSize;
        return num == 0 ? total / pageSize : total / pageSize + 1L;
    }
}
