-- 菜单 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('护理计划', '2000', '1', 'plan', 'nursing/plan/index', 1, 0, 'C', '0', '0', 'nursing:plan:list', '#', 'admin', sysdate(), '', null, '护理计划菜单');

-- 按钮父菜单ID
SELECT @parentId := LAST_INSERT_ID();

-- 按钮 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('护理计划查询', @parentId, '1',  '#', '', 1, 0, 'F', '0', '0', 'nursing:plan:query',        '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('护理计划新增', @parentId, '2',  '#', '', 1, 0, 'F', '0', '0', 'nursing:plan:add',          '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('护理计划修改', @parentId, '3',  '#', '', 1, 0, 'F', '0', '0', 'nursing:plan:edit',         '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('护理计划删除', @parentId, '4',  '#', '', 1, 0, 'F', '0', '0', 'nursing:plan:remove',       '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('护理计划导出', @parentId, '5',  '#', '', 1, 0, 'F', '0', '0', 'nursing:plan:export',       '#', 'admin', sysdate(), '', null, '');