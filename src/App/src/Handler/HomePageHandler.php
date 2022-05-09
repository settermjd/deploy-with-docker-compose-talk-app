<?php

declare(strict_types=1);

namespace App\Handler;

use Laminas\Diactoros\Response\HtmlResponse;
use Laminas\Diactoros\Response\JsonResponse;
use Mezzio\LaminasView\LaminasViewRenderer;
use Mezzio\Plates\PlatesRenderer;
use Mezzio\Router;
use Mezzio\Template\TemplateRendererInterface;
use Mezzio\Twig\TwigRenderer;
use Psr\Http\Message\ResponseInterface;
use Psr\Http\Message\ServerRequestInterface;
use Psr\Http\Server\RequestHandlerInterface;

class HomePageHandler implements RequestHandlerInterface
{
    /** @var string */
    private $containerName;

    /** @var Router\RouterInterface */
    private $router;

    /** @var null|TemplateRendererInterface */
    private $template;

    public function __construct(
        string $containerName,
        Router\RouterInterface $router,
        ?TemplateRendererInterface $template = null
    ) {
        $this->containerName = $containerName;
        $this->router        = $router;
        $this->template      = $template;
    }

    public function handle(ServerRequestInterface $request) : ResponseInterface
    {
        $data = [];

        $dbh = new \PDO(
            'mysql:host=database;port=3306;dbname=hawaii-five-0',
            'user',
            'password'
        );
        $stmt = $dbh->query(
            "select a.id as actor_id, c.first_name as character_first_name, c.last_name as character_last_name, c.title, a.first_name as actor_first_name, a.last_name as actor_last_name
            from actors a
            inner join character_to_actor cta1 on a.id = cta1.actor_id
            inner join characters c on cta1.character_id = c.id
            order by c.id"
        );

        return new HtmlResponse(
            $this->template->render(
                'app::home-page',
                [ 'stmt' => $stmt ]
            )
        );
    }
}
