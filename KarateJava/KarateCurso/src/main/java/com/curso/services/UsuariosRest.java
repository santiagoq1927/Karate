package com.curso.services;

import java.util.Collection;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.atomic.AtomicInteger;

import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.curso.model.Usuario;

@RestController
@RequestMapping("/empresa")
public class UsuariosRest {

	private final AtomicInteger counter = new AtomicInteger();
	private final Map<Integer, Usuario> usuarios = new ConcurrentHashMap<>();

	@GetMapping
	public Collection<Usuario> list() {
		return usuarios.values();
	}

	@GetMapping("/{id}")
	public Usuario get(@PathVariable int id) {
		return usuarios.get(id);
	}

	@PostMapping
	public Usuario create(@RequestBody Usuario usuario) {
		int id = counter.incrementAndGet();
		usuario.setId(id);
		usuarios.put(id, usuario);
		return usuario;
	}

	@PutMapping("/{id}")
	public Usuario put(@PathVariable int id, @RequestBody Usuario usuario) {
		usuarios.put(id, usuario);
		return usuario;
	}

	@DeleteMapping("/{id}")
	public void delete(@PathVariable int id) {
		Usuario p = usuarios.remove(id);
		if (p == null) {
			throw new RuntimeException("Usuario no encontrado con id: " + id);
		}
	}

	@DeleteMapping
	public void deleteWithBody(@RequestBody Usuario usuario) {
		delete(usuario.getId());
	}

}
