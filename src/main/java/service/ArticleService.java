package service;

import dao.ArticleDao;
import dao.UserDao;
import dto.ArticleDto;
import entities.Article;

import java.util.List;
import java.util.stream.Collectors;

public class ArticleService implements Service<Article, ArticleDto>{
    private final ArticleDao articleDao = new ArticleDao();
    private final UserDao userDao = new UserDao();
    @Override
    public List<ArticleDto> getAll() {
        return articleDao.getAll().stream().map(
                a -> new ArticleDto(a.getTitle(), a.getSummary(), a.getPrice_s(), a.getPrice_l(), a.getCategory(), a.getImageUrl(), a.getViews(), a.getLikes())
        ).collect(Collectors.toList());
    }

    @Override
    public ArticleDto getById(int id) {
        Article article = articleDao.getById(id);
        return new ArticleDto(article.getTitle(), article.getSummary(),article.getPrice_s(), article.getPrice_l(), article.getCategory(), article.getImageUrl(), article.getViews(), article.getLikes());
    }

    @Override
    public void insert(Article article) {
        articleDao.insert(article);
    }

    @Override
    public void update(Article article) {
        articleDao.update(article);
    }

    @Override
    public void delete(Article article) {
        articleDao.delete(article);
    }
}
