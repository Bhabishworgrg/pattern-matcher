using System.Text.RegularExpressions;

static bool MatchPattern(string line, string pattern)
{
	return Regex.IsMatch(line, pattern);
}

string pattern = args[0];

if (!Console.IsInputRedirected || Console.In.Peek() == -1)
{
	Console.WriteLine("Input expected: Input values to match from via a pipe.");
	Environment.Exit(1);
}

string[] input = Console.In.ReadToEnd().Split(new[] { '\n' }, StringSplitOptions.RemoveEmptyEntries);


foreach (string line in input)
{
	if (MatchPattern(line, pattern))
	{
		Console.WriteLine(line);
	}
}
Environment.Exit(0);
