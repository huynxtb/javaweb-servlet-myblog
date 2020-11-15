package com.myblog.dao.impl;

import com.myblog.dao.IUserDAO;
import com.myblog.mapper.UserMapper;
import com.myblog.model.UserModel;
import com.myblog.paging.Pageble;

import java.util.List;

public class UserDAO extends AbstractDAO<UserModel> implements IUserDAO {

	@Override
	public UserModel findByUserNameAndPasswordAndStatus(String userName, String password, Integer status) {
		StringBuilder sql = new StringBuilder("SELECT * FROM user AS u");
		sql.append(" INNER JOIN role AS r ON r.id = u.roleid");
		sql.append(" WHERE username = ? AND password = ? AND status = ?");
		List<UserModel> users = query(sql.toString(), new UserMapper(), userName, password, status);
		return users.isEmpty() ? null : users.get(0);
	}

	@Override
	public UserModel findOne(Long id) {
		String sql = "SELECT * FROM user WHERE id = ?";
		List<UserModel> user = query(sql, new UserMapper(), id);
		return user.isEmpty() ? null : user.get(0);
	}

	@Override
	public Long save(UserModel userModel) {
		StringBuilder sql = new StringBuilder("INSERT INTO user (username, password, fullname, email, status, roleid, createddate, createdby)");
		sql.append(" VALUES(?, ?, ?, ?, ?, ?, ?, ?)");
		return insert(sql.toString(), userModel.getUserName(), userModel.getPassword(), userModel.getFullName(), userModel.getEmail(),
				userModel.getStatus(), userModel.getRoleId(), userModel.getCreatedDate(), userModel.getCreatedBy());
	}

	@Override
	public UserModel findByUserName(String username) {
		String sql = "SELECT * FROM user WHERE username = ?";
		List<UserModel> user = query(sql, new UserMapper(), username);
		return user.isEmpty() ? null : user.get(0);
	}

	@Override
	public void update(UserModel updateUser) {
		StringBuilder sql = new StringBuilder("UPDATE user SET username = ?, password = ?,");
		sql.append(" fullname = ?, email = ?, status = ?, roleid = ?,");
		sql.append(" createddate = ?, createdby = ?, modifieddate = ?, modifiedby = ? WHERE id = ?");
		update(sql.toString(), updateUser.getUserName(), updateUser.getPassword(), updateUser.getFullName(), updateUser.getEmail(),
				updateUser.getStatus(), updateUser.getRoleId(), updateUser.getCreatedDate(), updateUser.getCreatedBy(),
				updateUser.getModifiedDate(), updateUser.getModifiedBy(), updateUser.getId());
	}
	@Override
	public void delete(UserModel deleteUser) {
		StringBuilder sql = new StringBuilder("UPDATE user SET username = ?, password = ?,");
		sql.append(" fullname = ?, email = ?, status = ?, roleid = ?,");
		sql.append(" createddate = ?, createdby = ?, modifieddate = ?, modifiedby = ? WHERE id = ?");
		update(sql.toString(), deleteUser.getUserName(), deleteUser.getPassword(), deleteUser.getFullName(), deleteUser.getEmail(),
				deleteUser.getStatus(), deleteUser.getRoleId(), deleteUser.getCreatedDate(), deleteUser.getCreatedBy(),
				deleteUser.getModifiedDate(), deleteUser.getModifiedBy(), deleteUser.getId());
	}

	@Override
	public List<UserModel> findAll(Pageble pageble) {
		StringBuilder sql = new StringBuilder("SELECT * FROM user");
		if (pageble.getSorter() != null ) {
			sql.append(" ORDER BY " + pageble.getSorter().getSortName() + " " + pageble.getSorter().getSortBy()+"");
		}
		if (pageble.getOffset() !=null && pageble.getLimit() != null) {
			sql.append(" LIMIT " + pageble.getOffset() + ", " + pageble.getLimit() +"");
		}
		return query(sql.toString(), new UserMapper());
	}

	@Override
	public int getTotalItem() {
		String sql = "SELECT count(*) FROM user";
		return count(sql);
	}

}
