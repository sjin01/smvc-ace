package net.hunanst.eduz100.service.oa;

import net.hunanst.eduz100.api.oa.Officialdocument;
import net.hunanst.eduz100.api.oa.OfficialdocumentMonitor;
import net.hunanst.eduz100.service.BaseService;

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