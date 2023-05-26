<?php

declare(strict_types=1);

namespace App\Handler;

use Laminas\Diactoros\Response\HtmlResponse;
use Mezzio\Template\TemplateRendererInterface;
use PDO;
use Psr\Http\Message\ResponseInterface;
use Psr\Http\Message\ServerRequestInterface;
use Psr\Http\Server\RequestHandlerInterface;

class HomePageHandler implements RequestHandlerInterface
{
    private TemplateRendererInterface $template;
    private PDO $dbh;

    public function __construct(TemplateRendererInterface $template, PDO $dbh)
    {
        $this->template = $template;
        $this->dbh      = $dbh;
    }

    public function handle(ServerRequestInterface $request) : ResponseInterface
    {
        $sqlQuery = <<<EOF
SELECT a.id AS actor_id, c.first_name AS character_first_name,
       c.last_name AS character_last_name, c.title, a.first_name AS actor_first_name,
       a.last_name AS actor_last_name
FROM actors a
INNER JOIN character_to_actor cta1 ON a.id = cta1.actor_id
INNER JOIN characters c ON cta1.character_id = c.id
ORDER BY c.id
EOF;

        $stmt = $this->dbh->query($sqlQuery);
        return new HtmlResponse(
            $this->template->render(
                'app::home-page',
                [ 'stmt' => $stmt ]
            )
        );
    }
}
