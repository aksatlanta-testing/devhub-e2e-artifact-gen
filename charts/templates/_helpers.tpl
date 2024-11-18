
{{- define "go-echo535dabcf-a04a-488a-9896-64d20613831a.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo535dabcf-a04a-488a-9896-64d20613831a.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}


{{- define "go-echo535dabcf-a04a-488a-9896-64d20613831a.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo535dabcf-a04a-488a-9896-64d20613831a.labels" -}}
helm.sh/chart: {{ include "go-echo535dabcf-a04a-488a-9896-64d20613831a.chart" . }}
{{ include "go-echo535dabcf-a04a-488a-9896-64d20613831a.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo535dabcf-a04a-488a-9896-64d20613831a.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo535dabcf-a04a-488a-9896-64d20613831a.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}