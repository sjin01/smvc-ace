package net.sjin.smvc.service.oa;

import net.sjin.smvc.api.oa.Officialdocument;
import net.sjin.smvc.api.oa.OfficialdocumentMonitor;
import net.sjin.smvc.service.BaseService;

import java.util.List;

public interface OfficialdocumentMonitorService extends BaseService<OfficialdocumentMonitor>{

    /**
     * 根据用户ID ，查找其 监视跟踪的 公文记录
     * @param monitor
     * @return
     * @throws Exception
     */
    List<Officialdocument> selectOfficialdocumentByMonitor (OfficialdocumentMonitor monitor) throws Exception;

    void deleteSelective (OfficialdocumentMonitor monitor) throws Exception;
}