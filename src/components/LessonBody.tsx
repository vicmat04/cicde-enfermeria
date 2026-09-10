import { Fragment, type ReactNode } from "react";

function isSafeHref(href: string) {
  try {
    const url = new URL(href);
    return url.protocol === "http:" || url.protocol === "https:";
  } catch {
    return false;
  }
}

function inline(text: string, prefix: string): ReactNode[] {
  const expression = /(\*\*[^*]+\*\*)|(`[^`]+`)|(\[[^\]]+\]\([^\s)]+\))/g;
  const nodes: ReactNode[] = [];
  let last = 0;
  let match: RegExpExecArray | null;
  let index = 0;

  while ((match = expression.exec(text))) {
    if (match.index > last) {
      nodes.push(text.slice(last, match.index));
    }

    const value = match[0];
    const key = `${prefix}-${index++}`;

    if (value.startsWith("**")) {
      nodes.push(<strong key={key}>{value.slice(2, -2)}</strong>);
    } else if (value.startsWith("`")) {
      nodes.push(<code key={key}>{value.slice(1, -1)}</code>);
    } else {
      const link = /^\[([^\]]+)\]\(([^\s)]+)\)$/.exec(value);
      if (link && isSafeHref(link[2])) {
        nodes.push(
          <a key={key} href={link[2]} target="_blank" rel="noreferrer noopener">
            {link[1]}
          </a>,
        );
      } else {
        nodes.push(value);
      }
    }

    last = expression.lastIndex;
  }

  if (last < text.length) {
    nodes.push(text.slice(last));
  }

  return nodes;
}

function tableCells(row: string) {
  return row
    .trim()
    .replace(/^\||\|$/g, "")
    .split("|")
    .map((cell) => cell.trim());
}

function isDivider(row: string) {
  return /^\s*\|?\s*:?-{3,}:?\s*(\|\s*:?-{3,}:?\s*)+\|?\s*$/.test(row);
}

function isHorizontalRule(row: string) {
  return /^\s*(-{3,}|\*{3,}|_{3,})\s*$/.test(row);
}

function isListItem(row: string) {
  return /^\s*([-*+] |\d+[.)] )/.test(row);
}

function isBlockquote(row: string) {
  return /^\s*>\s?/.test(row);
}

export function LessonBody({ body }: { body: string }) {
  const lines = body.replace(/\r\n/g, "\n").split("\n");
  const blocks: ReactNode[] = [];
  let line = 0;

  while (line < lines.length) {
    const current = lines[line];

    if (!current.trim()) {
      line++;
      continue;
    }

    if (isHorizontalRule(current)) {
      blocks.push(<hr key={`hr-${line}`} />);
      line++;
      continue;
    }

    if (isBlockquote(current)) {
      const quoteStart = line;
      const quoteLines: string[] = [];

      while (line < lines.length) {
        const quote = /^\s*>\s?(.*)$/.exec(lines[line]);
        if (!quote) {
          break;
        }
        quoteLines.push(quote[1]);
        line++;
      }

      blocks.push(
        <blockquote key={`quote-${quoteStart}`}>
          {quoteLines.map((quote, index) => (
            <Fragment key={index}>
              {index > 0 && <br />}
              {inline(quote, `quote-${quoteStart}-${index}`)}
            </Fragment>
          ))}
        </blockquote>,
      );
      continue;
    }

    if (current.includes("|") && lines[line + 1] && isDivider(lines[line + 1])) {
      const headers = tableCells(current);
      const rows: string[][] = [];
      line += 2;

      while (line < lines.length && lines[line].includes("|") && lines[line].trim()) {
        rows.push(tableCells(lines[line]));
        line++;
      }

      blocks.push(
        <div className="my-5 overflow-x-auto" key={`table-${line}`}>
          <table>
            <thead>
              <tr>
                {headers.map((header, index) => (
                  <th key={index}>{inline(header, `head-${index}`)}</th>
                ))}
              </tr>
            </thead>
            <tbody>
              {rows.map((row, rowIndex) => (
                <tr key={rowIndex}>
                  {headers.map((_, columnIndex) => (
                    <td key={columnIndex}>
                      {inline(row[columnIndex] || "", `cell-${rowIndex}-${columnIndex}`)}
                    </td>
                  ))}
                </tr>
              ))}
            </tbody>
          </table>
        </div>,
      );
      continue;
    }

    const listMatch = /^\s*([-*+] |\d+[.)] )(.*)$/.exec(current);
    if (listMatch) {
      const ordered = /^\d/.test(listMatch[1].trim());
      const items: string[] = [];

      while (line < lines.length) {
        const item = /^\s*([-*+] |\d+[.)] )(.*)$/.exec(lines[line]);
        if (!item || /^\d/.test(item[1].trim()) !== ordered) {
          break;
        }
        items.push(item[2]);
        line++;
      }

      const List = ordered ? "ol" : "ul";
      blocks.push(
        <List key={`list-${line}`}>
          {items.map((item, index) => (
            <li key={index}>{inline(item, `list-${index}`)}</li>
          ))}
        </List>,
      );
      continue;
    }

    const paragraph: string[] = [current];
    line++;

    while (
      line < lines.length &&
      lines[line].trim() &&
      !isHorizontalRule(lines[line]) &&
      !isBlockquote(lines[line]) &&
      !isListItem(lines[line]) &&
      !(lines[line].includes("|") && lines[line + 1] && isDivider(lines[line + 1]))
    ) {
      paragraph.push(lines[line]);
      line++;
    }

    blocks.push(
      <p key={`p-${line}`}>
        {paragraph.map((text, index) => (
          <Fragment key={index}>
            {index > 0 && <br />}
            {inline(text, `p-${line}-${index}`)}
          </Fragment>
        ))}
      </p>,
    );
  }

  return <div className="reading-copy">{blocks}</div>;
}
