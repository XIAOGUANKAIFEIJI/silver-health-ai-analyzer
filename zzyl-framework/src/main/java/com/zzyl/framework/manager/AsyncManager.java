package com.zzyl.framework.manager;

import java.util.TimerTask;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;
import com.zzyl.common.utils.Threads;
import com.zzyl.common.utils.spring.SpringUtils;

/**
 * 异步任务管理器
 *
 * @author ruoyi
 */
    /**
     */
    private final int OPERATE_DELAY_TIME = 10;

    /**
     * 异步操作任务调度线程池
     */
    private ScheduledExecutorService executor = SpringUtils.getBean("scheduledExecutorService");

    /**
     * 单例模式
     */

    private static AsyncManager me = new AsyncManager();

        return me;
    }

    /**
     * 执行任务
     *
     * @param task 任务
     */
        executor.schedule(task, OPERATE_DELAY_TIME, TimeUnit.MILLISECONDS);
    }

    /**
     * 停止任务线程池
     */
        Threads.shutdownAndAwaitTermination(executor);
    }
}
